#!/usr/bin/env bash
#
# Android Development Environment Setup Script
# Supports: aarch64/arm64 Linux (native build-tools)
# Author: miahsobuj
#

set -euo pipefail

# --- Configuration ---------------------------------------------------------
readonly SCRIPT_VERSION="2.0.0"
readonly ANDROID_SDK_VERSION="34"
readonly GRADLE_VERSION="8.7"
readonly BUILD_TOOLS_VERSION="34.0.0"
readonly BUILD_TOOLS_VERSION_NEW="36.1.0"

# URLs for aarch64 native tools
readonly LZHIYONG_SDK_URL="https://github.com/lzhiyong/android-sdk-tools/releases/download"
readonly HOMUHOMU_SDK_URL="https://github.com/HomuHomu833/android-sdk-custom/releases/download"
readonly GRADLE_DIST_URL="https://services.gradle.org/distributions"
readonly CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"

# --- Colors (disabled when output is not a TTY) ---------------------------
if [[ -t 1 ]]; then
    readonly RED='\033[0;31m'
    readonly GREEN='\033[0;32m'
    readonly YELLOW='\033[1;33m'
    readonly BLUE='\033[0;34m'
    readonly NC='\033[0m'
else
    readonly RED='' GREEN='' YELLOW='' BLUE='' NC=''
fi

log_info()    { echo -e "${BLUE}[INFO]${NC} $*"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $*"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $*"; }

# Global state (populated in main)
INSTALL_DIR=""
FORCE_X86=false
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
    cat << EOF
Android Development Environment Setup v${SCRIPT_VERSION}

Usage: $0 [OPTIONS]

OPTIONS:
    -h, --help              Show this help message
    -d, --dir DIR           Installation directory (default: ~/android-dev)
    -y, --yes               Skip confirmation prompts
    -c, --clean             Clean existing installation
    -v, --verify            Verify installation only
    -f, --force             Continue even on unsupported architecture
        --version           Print version and exit

EXAMPLES:
    $0                      # Interactive setup to ~/android-dev
    $0 -d /opt/android       # Custom installation directory
    $0 -c -y                # Clean and reinstall
    $0 -v                   # Verify current installation

EOF
    exit 0
}

# Best-effort cleanup on unexpected failure
on_error() {
    local rc=$?
    log_error "Setup failed (exit code ${rc}) at line ${1:-?}."
    log_info "You can remove the partial install with: $0 --clean -d '${INSTALL_DIR}'"
    exit "${rc}"
}
trap 'on_error ${LINENO}' ERR

# --- Helpers ----------------------------------------------------------------

# Detect the available package manager (Debian/Ubuntu vs Termux).
detect_pkg_manager() {
    if command -v apt-get >/dev/null 2>&1; then
        echo "apt"
    elif command -v pkg >/dev/null 2>&1; then
        echo "pkg"
    else
        echo "none"
    fi
}

check_architecture() {
    local arch
    arch=$(uname -m)

    case "${arch}" in
        aarch64|arm64|armv8*)
            log_info "Architecture: ${arch} (supported, native build-tools)"
            ;;
        x86_64|amd64)
            log_warn "Architecture: ${arch}"
            log_warn "This script targets aarch64/arm64. On x86_64 the official Google SDK is recommended."
            [[ "${FORCE_X86}" == true ]] || { log_error "Use --force to override."; exit 1; }
            ;;
        *)
            log_warn "Architecture: ${arch} (unrecognized)"
            [[ "${FORCE_X86}" == true ]] || { log_error "Use --force to override."; exit 1; }
            ;;
    esac
}

check_dependencies() {
    log_info "Checking dependencies..."

    local missing_deps=()

    command -v java   >/dev/null 2>&1 || missing_deps+=("java")
    command -v unzip  >/dev/null 2>&1 || missing_deps+=("unzip")
    command -v tar    >/dev/null 2>&1 || missing_deps+=("tar")
    command -v xz     >/dev/null 2>&1 || missing_deps+=("xz")
    command -v curl   >/dev/null 2>&1 || command -v wget >/dev/null 2>&1 || missing_deps+=("curl")

    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        local pm
        pm=$(detect_pkg_manager)
        case "${pm}" in
            apt) log_info "Install with: sudo apt-get install -y ${missing_deps[*]}" ;;
            pkg) log_info "Install with: pkg install ${missing_deps[*]}" ;;
            *)   log_info "Please install the missing packages manually." ;;
        esac
        exit 1
    fi

    local java_version java_major
    java_version=$(java -version 2>&1 | head -1 | cut -d'"' -f2)
    java_major=$(echo "${java_version}" | cut -d'.' -f1)
    log_info "Java version: ${java_version}"

    if [[ -z "${java_major}" || "${java_major}" -lt 17 ]]; then
        log_error "Java 17+ is required. Found: ${java_version}"
        log_info "Debian/Ubuntu: sudo apt-get install openjdk-17-jdk"
        log_info "Termux:        pkg install openjdk-17"
        exit 1
    fi

    log_success "All dependencies satisfied"
}

# Download a file using curl (or wget as a fallback), with retries.
download_file() {
    local url="$1"
    local output="$2"
    local description="$3"
    local attempts=3

    log_info "Downloading ${description}..."
    log_info "  ${url}"

    for ((i = 1; i <= attempts; i++)); do
        if command -v curl >/dev/null 2>&1; then
            if curl -fL --retry 2 --connect-timeout 20 --progress-bar -o "${output}" "${url}"; then
                log_success "Downloaded ${description}"
                return 0
            fi
        elif command -v wget >/dev/null 2>&1; then
            if wget -q --show-progress -O "${output}" "${url}"; then
                log_success "Downloaded ${description}"
                return 0
            fi
        fi
        log_warn "Download attempt ${i}/${attempts} failed for ${description}"
    done

    log_error "Failed to download ${description}"
    return 1
}

# --- Install steps ----------------------------------------------------------

install_java() {
    if command -v java >/dev/null 2>&1; then
        log_info "Java already installed: $(java -version 2>&1 | head -1)"
        return 0
    fi

    log_info "Installing OpenJDK 17..."
    local pm
    pm=$(detect_pkg_manager)

    case "${pm}" in
        apt)
            sudo apt-get update && sudo apt-get install -y openjdk-17-jdk
            ;;
        pkg)
            pkg install -y openjdk-17
            ;;
        *)
            log_error "Cannot install Java automatically. Please install JDK 17 manually."
            exit 1
            ;;
    esac

    log_success "OpenJDK 17 installed"
}

install_gradle() {
    local gradle_dir="${INSTALL_DIR}/gradle"
    local gradle_home="${gradle_dir}/gradle-${GRADLE_VERSION}"
    local gradle_bin="${gradle_home}/bin/gradle"

    if [[ -x "${gradle_bin}" ]]; then
        log_info "Gradle already installed: ${gradle_bin}"
        return 0
    fi

    log_info "Installing Gradle ${GRADLE_VERSION}..."
    mkdir -p "${gradle_dir}"

    local zip_path="${gradle_dir}/gradle.zip"
    download_file \
        "${GRADLE_DIST_URL}/gradle-${GRADLE_VERSION}-bin.zip" \
        "${zip_path}" \
        "Gradle ${GRADLE_VERSION}"

    ( cd "${gradle_dir}" && unzip -qo gradle.zip )
    rm -f "${zip_path}"

    [[ -d "${gradle_home}" ]] || { log_error "Gradle extraction failed (${gradle_home} missing)"; return 1; }

    log_success "Gradle installed: ${gradle_bin}"
}

install_android_sdk() {
    local sdk_dir="${INSTALL_DIR}/sdk"

    if [[ -d "${sdk_dir}/build-tools/${BUILD_TOOLS_VERSION}" ]]; then
        log_info "Android SDK already installed"
        return 0
    fi

    log_info "Installing Android SDK (aarch64 native build-tools)..."
    mkdir -p "${sdk_dir}"

    # 1. lzhiyong's static aarch64 build-tools (34.0.0 + platform-tools)
    local lzy_zip="${sdk_dir}/aarch64-tools.zip"
    download_file \
        "${LZHIYONG_SDK_URL}/34.0.3/android-sdk-tools-static-aarch64.zip" \
        "${lzy_zip}" \
        "lzhiyong's aarch64 SDK tools"

    ( cd "${sdk_dir}" && unzip -oq aarch64-tools.zip )
    rm -f "${lzy_zip}"

    # Organize build-tools into the versioned directory Gradle expects.
    mkdir -p "${sdk_dir}/build-tools/${BUILD_TOOLS_VERSION}"
    for tool in aapt aapt2 aidl dexdump split-select zipalign apksigner; do
        [[ -f "${sdk_dir}/build-tools/${tool}" ]] && \
            mv -f "${sdk_dir}/build-tools/${tool}" "${sdk_dir}/build-tools/${BUILD_TOOLS_VERSION}/" 2>/dev/null || true
    done

    # 2. HomuHomu's newer aarch64 build-tools (36.1.0)
    log_info "Downloading HomuHomu's aarch64 SDK (build-tools ${BUILD_TOOLS_VERSION_NEW})..."
    local hh_arch="${sdk_dir}/homuhomu-sdk.tar.xz"
    download_file \
        "${HOMUHOMU_SDK_URL}/36.0.0/android-sdk-aarch64-linux-musl.tar.xz" \
        "${hh_arch}" \
        "HomuHomu's aarch64 SDK"

    ( cd "${sdk_dir}" && tar -xf homuhomu-sdk.tar.xz )
    rm -f "${hh_arch}"

    if [[ -d "${sdk_dir}/android-sdk/build-tools/${BUILD_TOOLS_VERSION_NEW}" ]]; then
        mv -f "${sdk_dir}/android-sdk/build-tools/${BUILD_TOOLS_VERSION_NEW}" "${sdk_dir}/build-tools/"
        rm -rf "${sdk_dir}/android-sdk"
    else
        log_warn "HomuHomu build-tools ${BUILD_TOOLS_VERSION_NEW} not found after extraction"
    fi

    log_success "Android SDK installed"
}

install_android_cmdline_tools() {
    local sdk_dir="${INSTALL_DIR}/sdk"
    local cmdline_dir="${sdk_dir}/cmdline-tools"
    local latest_dir="${cmdline_dir}/latest"

    if [[ -d "${latest_dir}/bin" ]]; then
        log_info "Android cmdline-tools already installed"
        return 0
    fi

    log_info "Installing Android cmdline-tools..."
    mkdir -p "${cmdline_dir}"

    local zip_path="${cmdline_dir}/cmdline-tools.zip"
    download_file \
        "${CMDLINE_TOOLS_URL}" \
        "${zip_path}" \
        "Android cmdline-tools"

    ( cd "${cmdline_dir}" && unzip -q cmdline-tools.zip )
    rm -f "${zip_path}"

    # The zip extracts to a top-level "cmdline-tools/" directory.
    if [[ -d "${cmdline_dir}/cmdline-tools" && ! -d "${latest_dir}" ]]; then
        mv "${cmdline_dir}/cmdline-tools" "${latest_dir}"
    fi

    [[ -x "${latest_dir}/bin/sdkmanager" ]] || {
        log_error "sdkmanager not found after extraction"
        return 1
    }

    # Accept licenses
    yes | "${latest_dir}/bin/sdkmanager" --licenses >/dev/null 2>&1 || true

    log_info "Installing SDK components (platform-tools, platform API ${ANDROID_SDK_VERSION}, build-tools)..."
    "${latest_dir}/bin/sdkmanager" \
        "platform-tools" \
        "platforms;android-${ANDROID_SDK_VERSION}" \
        "build-tools;${BUILD_TOOLS_VERSION}" \
        --sdk_root="${sdk_dir}"

    log_success "Android cmdline-tools installed"
}

setup_environment() {
    log_info "Setting up environment variables..."

    local env_file="${HOME}/.bashrc.android"

    cat > "${env_file}" << EOF
# Android Development Environment
# Generated by android-setup.sh (v${SCRIPT_VERSION})

export ANDROID_HOME="${INSTALL_DIR}/sdk"
export ANDROID_SDK_ROOT="\${ANDROID_HOME}"
export JAVA_HOME="\$(dirname "\$(dirname "\$(readlink -f "\$(which java)")")")"

# Add SDK tools to PATH
export PATH="\${ANDROID_HOME}/cmdline-tools/latest/bin:\${ANDROID_HOME}/platform-tools:\${PATH}"

# Add Gradle to PATH
export PATH="${INSTALL_DIR}/gradle/gradle-${GRADLE_VERSION}/bin:\${PATH}"

# Aliases for common tasks
alias adb-devices='adb devices'
alias adb-logcat='adb logcat'
alias gradle-clean='./gradlew clean'
alias gradle-build='./gradlew assembleDebug'
alias gradle-release='./gradlew assembleRelease'
EOF

    # Write a valid (absolute-path) local.properties next to the sample app if present.
    local sample_dir="${SCRIPT_DIR}/../sample-app"
    if [[ -d "${sample_dir}" ]]; then
        cat > "${sample_dir}/local.properties" << EOF
sdk.dir=${INSTALL_DIR}/sdk
EOF
        log_info "Wrote ${sample_dir}/local.properties"
    fi

    log_success "Environment file created: ${env_file}"
    log_info "Add to your shell: source ${env_file}"
}

verify_installation() {
    log_info "Verifying installation..."

    local errors=0

    if command -v java >/dev/null 2>&1; then
        log_success "Java: $(java -version 2>&1 | head -1)"
    else
        log_error "Java not found"
        ((errors++))
    fi

    local gradle_bin="${INSTALL_DIR}/gradle/gradle-${GRADLE_VERSION}/bin/gradle"
    if [[ -x "${gradle_bin}" ]]; then
        log_success "Gradle: $(${gradle_bin} --version 2>&1 | head -1)"
    else
        log_error "Gradle not found at ${gradle_bin}"
        ((errors++))
    fi

    local aapt2="${INSTALL_DIR}/sdk/build-tools/${BUILD_TOOLS_VERSION}/aapt2"
    if [[ -x "${aapt2}" ]]; then
        log_success "aapt2: $(${aapt2} version 2>&1)"
    else
        log_warn "aapt2 not found at ${aapt2} (native build-tools may not have installed)"
        ((errors++))
    fi

    local sdkmanager="${INSTALL_DIR}/sdk/cmdline-tools/latest/bin/sdkmanager"
    if [[ -x "${sdkmanager}" ]]; then
        log_success "sdkmanager: installed"
    else
        log_warn "sdkmanager not found at ${sdkmanager}"
        ((errors++))
    fi

    if [[ ${errors} -eq 0 ]]; then
        log_success "Installation verified successfully!"
        return 0
    else
        log_error "Verification failed with ${errors} error(s)"
        return 1
    fi
}

# --- Main -------------------------------------------------------------------

main() {
    local install_dir="${HOME}/android-dev"
    local clean_mode=false
    local verify_only=false
    local skip_confirmation=false

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)    usage ;;
            --version)    echo "v${SCRIPT_VERSION}"; exit 0 ;;
            -d|--dir)     install_dir="$2"; shift 2 ;;
            -y|--yes)     skip_confirmation=true; shift ;;
            -c|--clean)   clean_mode=true; shift ;;
            -v|--verify)  verify_only=true; shift ;;
            -f|--force)   FORCE_X86=true; shift ;;
            *) log_error "Unknown option: $1"; exit 1 ;;
        esac
    done

    INSTALL_DIR="${install_dir}"

    echo "============================================"
    echo " Android Development Setup v${SCRIPT_VERSION}"
    echo "============================================"
    echo ""

    if [[ "${verify_only}" == true ]]; then
        verify_installation
        exit $?
    fi

    if [[ "${clean_mode}" == true ]]; then
        log_info "Cleaning up ${INSTALL_DIR} ..."
        rm -rf "${INSTALL_DIR}"
        rm -f "${HOME}/.bashrc.android"
        log_success "Cleanup complete"
        [[ "${skip_confirmation}" == true ]] || exit 0
    fi

    check_architecture
    check_dependencies

    if [[ "${skip_confirmation}" != true ]]; then
        echo ""
        log_warn "Installation directory: ${INSTALL_DIR}"
        read -p "Continue? (y/N) " -n 1 -r
        echo ""
        if [[ ! ${REPLY} =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi

    install_java
    install_gradle
    install_android_sdk
    install_android_cmdline_tools
    setup_environment

    echo ""
    echo "============================================"
    verify_installation
    echo ""
    log_success "Setup complete!"
    echo ""
    log_info "To use, run: source ${HOME}/.bashrc.android"
    echo "============================================"
}

main "$@"
