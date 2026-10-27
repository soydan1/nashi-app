<p align="center"><img src="Resources/Brand/NashiIcon.png" width="128" alt="Nashi"></p>
<h1 align="center">Nashi</h1>
<p align="center">Your files, a little sweeter. · Dosyaların için tatlı bir kolaylık.</p>

[English guide](https://orkunisitmak.github.io/nashi-app/) · [Türkçe](https://orkunisitmak.github.io/nashi-app/tr/) · [Upstream releases](https://github.com/orkunisitmak/nashi-app/releases/latest) · [Security](SECURITY.md)

Nashi is an independent, open-source file conversion and editing app inspired by [Tangerine](https://tangerineformac.com/)'s drag-and-wheel interaction. It adds public web-media downloads, QR reading, refined crop/annotation workflows, keyboard media editing and live progress. Nashi is not affiliated with Tangerine or LEAP STUDIO and includes no proprietary reference-app binaries or artwork.

**This fork is macOS-only and has no built-in app updater.** Install newer versions manually. External-tool downloads/setup remain available. Links to the upstream site and releases below describe the original project, not builds of this fork.

Try the [interactive browser playground](https://orkunisitmak.github.io/nashi-app/#playground): drag sample files, use the wheel and shortcuts, and explore all 27 tools. Supported image/PDF/audio exports are real; desktop-only operations are labeled previews.

## See Nashi in action

[![Nashi real screen recording: Finder drag, conversion wheel, crop and video trim](docs/assets/showcase/nashi-demo.gif?v=50e9219b2083)](https://orkunisitmak.github.io/nashi-app/#demo)

**[Watch the 95-second screen recording](https://orkunisitmak.github.io/nashi-app/#demo)** · **[Türkçe demo](https://orkunisitmak.github.io/nashi-app/tr/#demo)** · [MP4](https://orkunisitmak.github.io/nashi-app/assets/showcase/nashi-demo.mp4?v=50e9219b2083)

A real macOS 0.7.3 screen recording: drag files in Finder, use the wheel to convert to JPG, crop an image and trim a video with In/Out handles. Pauses and longer previews are shortened; retained actions play at normal speed. English and Turkish captions are available in the video player.

| macOS · Home | macOS · Crop image |
| :---: | :---: |
| [![Nashi Mac Home with file selection and quick actions](docs/assets/showcase/mac-home.png)](docs/assets/showcase/mac-home.png) | [![Nashi Mac crop editor with a square selection and aspect ratio controls](docs/assets/showcase/mac-crop.png)](docs/assets/showcase/mac-crop.png) |
| **macOS · Video trim** | **macOS · Wheel** |
| [![Nashi video trim editor with In and Out handles and a selected range](docs/assets/showcase/mac-trim.png)](docs/assets/showcase/mac-trim.png) | [![Nashi conversion wheel](docs/assets/showcase/mac-wheel.png)](docs/assets/showcase/mac-wheel.png) |

Demo files contain Nashi's own artwork; no personal files or account details are shown.

## Download and use

Build this fork using the instructions below, then move `build/Nashi.app` to your Applications folder. The macOS catalog has 27 tools, 45 input formats and 275 conversion routes.

[Upstream macOS releases](https://github.com/orkunisitmak/nashi-app/releases/latest) are available separately; they do not include this fork’s changes.

First launch guides you through **Finish setup → Download missing tools** for hash-verified downloads directly from upstream. Media and Office tools install in sequence; existing tools are kept, and cancelled or failed setup can be retried. **Tools ready** appears only when both groups are available. Core native image/PDF features work immediately. [Exact versions, hashes and licenses](docs/dependencies.md).

Source builds use ad-hoc signing by default and are not Apple-notarized. macOS may require first-launch approval; consult [Apple's guidance](https://support.apple.com/en-us/102445). Nashi does not disable system security settings.

## Shortcuts

On macOS, hold **Shift** while dragging in Finder for conversion, **Command** for tools or **Control** for file actions. **Control–Shift–D** downloads a copied public link. Drag modifiers are customizable. Use **Command+O** to choose files, **Command+V** to import copied files/text/images, **Command+2** to open Library and **Command+F** to search it. Normal paste inside text fields is preserved.

Supported media editors use **Space** for play/pause, **Left/Right** to seek one second and **I/O** to mark a range. Crop uses drag, **Shift** for aspect lock and **Enter** to save. The [English](https://orkunisitmak.github.io/nashi-app/#shortcuts) and [Turkish](https://orkunisitmak.github.io/nashi-app/tr/#shortcuts) pages contain the complete macOS shortcut sheet.

## Build

For macOS: Apple Silicon, macOS 13+ and Xcode/Swift 6.

```sh
scripts/setup-exiftool.sh
swift build --product Nashi
swift test
scripts/build-app.sh release
```

The app is written to `build/Nashi.app`. Large runtimes are installed through its setup screen. Source builds use an ad-hoc signature unless you provide your own ignored signing profile. Signing private keys are never distributed. When replacing a bundle from the original project, use a fresh `NASHI_APP_OUTPUT` directory so old frameworks and services are not retained.

## Privacy and updates

Conversion/editing run locally. Web downloads contact the selected media site. No analytics, cloud account or browser-cookie import is built in. This fork does not check for, download or install app updates. Install a newer build manually after your current operations finish. External-tool setup still downloads hash-verified tools directly from upstream.

## License and acknowledgments

Nashi's original source is [MIT](LICENSE). Vendored libraries and external tools retain their own licenses; see [macOS notices](Resources/THIRD-PARTY-NOTICES.txt) and [runtime setup](docs/dependencies.md). No purchase flow or reference-app account is required.
