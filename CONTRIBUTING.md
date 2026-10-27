# Contributing

Please open an issue describing the problem, platform, app version and expected
behavior before proposing a large change. Small fixes can go directly to a PR.
Use synthetic, redistributable fixtures; never attach private documents or keys.

macOS: Xcode with Swift 6, macOS 13+, Apple Silicon. Run `swift test`.
This fork is macOS-only and does not include an app updater. External-tool setup is retained.

For native UI changes, use the [isolated UI audit](docs/testing/UI-AUDIT.md) to
check light/dark and English/Turkish scenes without dragging personal files.
It complements the native gesture, keyboard and export tests; it does not replace them.

New output formats and tools must preserve originals, choose unique output names,
clean partial exports on cancellation, and avoid shell interpolation. Test these
boundaries and actual output metadata rather than only checking file existence.

Nashi is independently developed and inspired by Tangerine's drag-and-wheel
interaction. Do not contribute proprietary Tangerine code, binaries, artwork,
screenshots or decompiled resources. Third-party licenses must be preserved.

## Checks and pull requests

GitHub Actions only runs lightweight source/security checks on Linux. macOS builds,
Swift tests and native UI checks are run locally when needed; see the
[build instructions](README.md#build) and [UI audit guide](docs/testing/UI-AUDIT.md).
Pull requests are reviewed and merged manually. This fork has no auto-merge automation.
