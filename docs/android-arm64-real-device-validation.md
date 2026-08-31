# Android arm64 real-device validation

**Status:** In progress  
**Last verified:** 2026-09-01 02:56 (device-local log time)

This document records the current real-device validation path for building and testing a minimal Android APK containing an arm64-v8a native library. It is a validation note, not a claim that every community Android SDK component is production-ready.

## Current test target

- Package: `com.test.arm64device`
- Activity: `com.test.arm64device.MainActivity`
- Native library: `lib/arm64-v8a/libarm64test.so`
- Test workspace: `/tmp/real-device-test`
- Device class: physical Android arm64 device
- Build-tools used for alignment: `$HOME/android-sdk/build-tools/35.0.2/zipalign`
- System signer: `/usr/bin/apksigner` version `0.9`
- APK signer result: v1, v2 and v3 verified successfully

## Verified pipeline so far

1. Native library was packaged under the correct APK ABI path: `lib/arm64-v8a/libarm64test.so`.
2. Minimal APK was created successfully.
3. `zipalign` verification succeeded.
4. `apksigner` was initially expected under the SDK build-tools directory, but the installed system package provides it at `/usr/bin/apksigner`. Do not repeatedly search for an SDK copy when the system tool is already installed and working.
5. APK signing succeeded.
6. `apksigner verify --verbose` reported v1/v2/v3 signatures as valid.
7. `adb install -r out/final-native-signed.apk` succeeded.
8. The package was installed on the physical device and the APK launch reached the native-library loading stage.

## Current blocking failure

The first clean launch reaches `System.loadLibrary()` and fails with:

`java.lang.UnsatisfiedLinkError: dlopen failed: cannot locate symbol "__android_log_print" referenced by .../libarm64test.so`

This is a **native-library dependency/linking problem**, not an APK packaging, zipalign, signing, ABI-path, or installation problem.

The loader successfully found the APK's arm64 library, but the library has an unresolved reference to Android's `__android_log_print`. The native library therefore needs an explicit dependency on Android `liblog` and must be linked with the Android toolchain/sysroot rather than treated as an ordinary Linux shared object.

## Next action — do this before changing Java/APK packaging

Rebuild `libarm64test.so` against the Android arm64 target and `liblog`.

Prefer the installed Android NDK clang toolchain. The exact NDK directory/version should be taken from the current machine rather than invented. For example, after locating the installed NDK:

```bash
find "$HOME/android-sdk/ndk" -maxdepth 3 -type f -name clang | head
```

Then use the matching NDK clang with an Android target and link `liblog`:

```bash
# Example shape; replace NDK_ROOT with the actual installed NDK root.
NDK_ROOT="$HOME/android-sdk/ndk/<installed-version>"
CLANG="$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin/clang"

"$CLANG" \
  --target=aarch64-linux-android<API> \
  -fPIC \
  -shared \
  native/test.c \
  -llog \
  -o native/arm64-v8a/libarm64test.so
```

Use the same Android API level already selected by the test project; do not invent a new API level merely to fix this error.

## Verify the native library before repackaging

Run:

```bash
file native/arm64-v8a/libarm64test.so
readelf -d native/arm64-v8a/libarm64test.so | grep NEEDED
readelf -Ws native/arm64-v8a/libarm64test.so | grep __android_log_print
```

The important result is that the dynamic dependency list includes Android `liblog.so` (normally shown as `liblog.so`) and the library remains an AArch64 Android shared object.

If the symbol is still unresolved after linking, inspect the complete dynamic section and stop there; do not proceed to APK packaging until the native dependency is correct.

## Rebuild/package/sign/install sequence

Once the native library passes the checks above:

```bash
cd /tmp/real-device-test

rm -f out/final-unsigned-native.apk out/final-native-aligned.apk out/final-native-signed.apk

cd out/apk-root
zip -q -r ../final-unsigned-native.apk .
cd ../..

"$HOME/android-sdk/build-tools/35.0.2/zipalign" \
  -f 4 \
  out/final-unsigned-native.apk \
  out/final-native-aligned.apk

"$HOME/android-sdk/build-tools/35.0.2/zipalign" \
  -c -P 4 -v 4 \
  out/final-native-aligned.apk

apksigner sign \
  --ks out/test.keystore \
  --ks-pass pass:android \
  --key-pass pass:android \
  --out out/final-native-signed.apk \
  out/final-native-aligned.apk

apksigner verify --verbose out/final-native-signed.apk
adb install -r out/final-native-signed.apk
```

## Fresh runtime validation

Clear logcat before the test so the result is attributable to the current APK:

```bash
adb logcat -c
adb shell am force-stop com.test.arm64device
adb shell monkey -p com.test.arm64device 1 >/dev/null
sleep 1

adb logcat -d -v threadtime | grep -A 30 -B 5 -E \
'FATAL EXCEPTION|AndroidRuntime|UnsatisfiedLinkError|NoSuchMethodError|NoClassDefFoundError|ClassNotFoundException|SIGSEGV|Fatal signal'
```

Success criterion for this gate: no `UnsatisfiedLinkError` for `__android_log_print`, and the Activity remains alive. Only after that should the test move to checking actual native function execution/output.

## Diagnostic rule

Do not classify the current failure as an ARM64 incompatibility. The device loaded the arm64 library path and attempted `dlopen`; the observed failure is a missing Android `liblog` dependency.

Do not change `MainActivity.java`, APK manifest/package structure, signing, or zipalign to solve this specific error unless a new independent error appears after the native dependency is fixed.

## Scope boundary

This real-device validation work belongs to the Android arm64 tooling/validation track. It must not be mixed with unrelated ARM64 build-tooling experiments in another workspace. Keep `/tmp/real-device-test` and its evidence separate from other ARM64 toolchain projects.
