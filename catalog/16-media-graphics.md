# 16 — Media & Graphics

Media processing, image editing, and creative apps — native **arm64** builds.

## CLI tools

| Tool | Description | Install |
|------|-------------|---------|
| **ffmpeg** | Transcode/stream/play multimedia (arm64 in Debian; `ffmpeg-rpi` w/ hw-accel on Arch ARM) | `sudo apt install ffmpeg` |
| **mpv** | Video player (MPlayer-based) | `sudo apt install mpv` |
| **ImageMagick** | Image manipulation (`convert`, `mogrify`, `identify`…) | `sudo apt install imagemagick` |
| **sox** | Audio processing | `sudo apt install sox` |
| **mjpg-streamer** | Webcam → HTTP JPEG/MJPEG streaming | build from source (`cmake`) |

### Usage examples

```bash
ffmpeg -i in.mp4 -c:v libx264 -crf 23 out.mp4          # transcode
ffmpeg -i in.mkv -vf scale=1280:720 out.mp4            # resize
mpv --hwdec=drm-copy video.mp4                          # hw-accel on Pi
convert img.png -resize 800x800 out.png                 # resize image
```

> Static arm64 ffmpeg binaries also available via
> [eugeneware/ffmpeg-static](https://github.com/eugeneware/ffmpeg-static)
> (John Van Sickle Linux arm64 builds).

## GUI applications (creative suite)

| Tool | Description | arm64 | Install |
|------|-------------|-------|---------|
| **GIMP** | Image editor (v3.x) | ✅ | `GIMP-*-aarch64.AppImage` or `sudo apt install gimp` / Flatpak |
| **Blender** | 3D creation suite | ✅ | Snap/`apt install blender` / official tarball |
| **Inkscape** | Vector graphics | ✅ | `sudo apt install inkscape` |
| **Krita** | Digital painting | ✅ | AppImage/Flatpak |
| **LibreOffice** | Office suite | ✅ | `sudo apt install libreoffice` |
| **Kdenlive** | Video editor | ✅ | `sudo apt install kdenlive` |
| **Shotcut** | Video editor | ✅ | AppImage |
| **OBS Studio** | Live streaming/recording | ✅ | `sudo apt install obs-studio` |
| **Audacity** | Audio editor | ✅ | `sudo apt install audacity` |
| **digiKam** | Photo manager | ✅ | AppImage |

### Notes

- GIMP publishes a dedicated **`aarch64.AppImage`** for ARM Linux.
- Blender 5.x is current (2026); Ubuntu arm64 via Snap or official download.
- On Raspberry Pi, use `mpv --hwdec=drm-copy` (or `v4l2m2m`) for hardware video decoding.

*License: GPL (ffmpeg/mpv/GIMP/Blender/Inkscape/Krita/LibreOffice/…), Apache-2.0 (ImageMagick), GPL-2.0 (OBS). Collector holds no rights.*
