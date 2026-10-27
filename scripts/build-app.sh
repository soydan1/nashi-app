#!/bin/zsh
set -euo pipefail
cd "${0:A:h:h}"
configuration=${1:-release}
source scripts/signing-configuration.sh
nashi_load_signing_configuration
# Release binaries do not embed the builder's home-directory/source paths.
swift build -c "$configuration" --product Nashi -Xswiftc -file-prefix-map -Xswiftc "$PWD=/nashi" -Xswiftc -file-compilation-dir -Xswiftc /nashi
binary_dir=$(swift build -c "$configuration" --show-bin-path)
application=${NASHI_APP_OUTPUT:-"$PWD/build/Nashi.app"}
if [[ -f "$application/Contents/Info.plist" ]]; then
  existing_identifier=$(plutil -extract CFBundleIdentifier raw -o - "$application/Contents/Info.plist")
  expected_identifier=$(plutil -extract CFBundleIdentifier raw -o - Resources/Info.plist)
  if [[ "$existing_identifier" != "$expected_identifier" ]]; then print -u2 "Refusing to overwrite a different application at $application"; exit 1; fi
fi
# Do not carry an old updater, broker or bundled runtime into the new package.
if [[ -d "$application/Contents/Frameworks" || -d "$application/Contents/XPCServices" || -e "$application/Contents/Resources/Tools/ffmpeg" || -d "$application/Contents/Resources/Tools/LibreOffice.app" ]]; then
  print -u2 "Use a fresh NASHI_APP_OUTPUT directory without legacy frameworks, services or bundled runtimes."
  exit 1
fi
mkdir -p "$application/Contents/MacOS" "$application/Contents/Resources/Tools"
cp "$binary_dir/Nashi" "$application/Contents/MacOS/Nashi"
if [[ "$configuration" == release ]]; then /usr/bin/strip -S "$application/Contents/MacOS/Nashi"; fi
cp Resources/Info.plist "$application/Contents/Info.plist"
python3 scripts/generate-localizations.py
ditto Resources/Localizations "$application/Contents/Resources"
if [[ -d "$binary_dir/Nashi_NashiCore.bundle" ]]; then ditto "$binary_dir/Nashi_NashiCore.bundle" "$application/Contents/Resources/Nashi_NashiCore.bundle"; fi
if [[ -n "${NASHI_APP_VERSION:-}" ]]; then
  if [[ ! "$NASHI_APP_VERSION" =~ '^[0-9]+\.[0-9]+\.[0-9]+$' ]]; then print -u2 'NASHI_APP_VERSION must be a numeric major.minor.patch version.'; exit 1; fi
  plutil -replace CFBundleShortVersionString -string "$NASHI_APP_VERSION" "$application/Contents/Info.plist"
fi
if [[ -n "${NASHI_BUILD_NUMBER:-}" ]]; then
  if [[ ! "$NASHI_BUILD_NUMBER" =~ '^[0-9]+$' ]]; then print -u2 'NASHI_BUILD_NUMBER must be numeric.'; exit 1; fi
  plutil -replace CFBundleVersion -string "$NASHI_BUILD_NUMBER" "$application/Contents/Info.plist"
fi
if [[ -f Tools/ExifTool/exiftool ]]; then
  ditto Tools/ExifTool "$application/Contents/Resources/Tools/ExifTool"
else
  print -u2 "Missing Tools/ExifTool; run scripts/setup-exiftool.sh"
  exit 1
fi
ditto Resources/Sounds "$application/Contents/Resources/Sounds"
cp Resources/PagesInterop.js "$application/Contents/Resources/PagesInterop.js"
cp Resources/PDFLib.js Resources/PDFInterop.js "$application/Contents/Resources/"
if [[ -f Resources/NashiIcon.icns ]]; then cp Resources/NashiIcon.icns "$application/Contents/Resources/NashiIcon.icns"; fi
cp Resources/THIRD-PARTY-NOTICES.txt "$application/Contents/Resources/THIRD-PARTY-NOTICES.txt"
ditto Resources/licenses "$application/Contents/Resources/licenses"
codesign "${nashi_signing_flags[@]}" "$application"
codesign --verify --deep --strict "$application"
nashi_verify_signing_identity "$application"
print "$application"
