#!/bin/zsh
set -euo pipefail
cd "${0:A:h:h}"
if (( $# != 2 )); then print -u2 'Usage: scripts/prepare-public-release.sh VERSION BUILD'; exit 1; fi
if [[ ! "$1" =~ '^[0-9]+\.[0-9]+\.[0-9]+$' || ! "$2" =~ '^[0-9]+$' ]]; then print -u2 'Use numeric release versions.'; exit 1; fi
export NASHI_APP_VERSION=$1 NASHI_BUILD_NUMBER=$2
export NASHI_APP_OUTPUT=${NASHI_APP_OUTPUT:-"$PWD/build/public-$1-$2/Nashi.app"}
upload_directory="$PWD/build/public-upload-$1-$2"
archive="$upload_directory/Nashi-macOS-arm64-$1-$2.zip"
if [[ -e "$archive" || -e "$upload_directory/Nashi-macOS-arm64.zip" ]]; then print -u2 'This release archive already exists. Keep it immutable and increment the version.'; exit 1; fi
scripts/build-app.sh release
python3 scripts/audit-release.py "$NASHI_APP_OUTPUT"
mkdir -p "$upload_directory"
python3 scripts/archive-app.py "$NASHI_APP_OUTPUT" "$archive"
cp "$archive" "$upload_directory/Nashi-macOS-arm64.zip"
(cd "$upload_directory" && shasum -a 256 *.zip > SHA256SUMS.txt)
print "Manual-install archives and checksums: $upload_directory"
