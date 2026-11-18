#!/usr/bin/env bash
# Points Casks/raw-importer.rb at the newest RAW Importer release.
# Downloads the DMG, checks it against the published .sha256 file and only
# ever moves the version forward. Prints the new version, or nothing if the
# cask is already current.
set -euo pipefail

REPO="Leon83858/RAW_Importer"
CASK="Casks/raw-importer.rb"

tag="$(gh release view --repo "$REPO" --json tagName -q .tagName)"
latest="${tag#v}"
current="$(sed -n 's/^  version "\(.*\)"$/\1/p' "$CASK")"
[[ -n "$latest" && -n "$current" ]] || { echo "could not read versions" >&2; exit 1; }

if [[ "$latest" == "$current" ]]; then
  echo "cask already at $current" >&2
  exit 0
fi
newest="$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -1)"
if [[ "$newest" != "$latest" ]]; then
  echo "latest release $latest is older than cask $current; not downgrading" >&2
  exit 0
fi

asset="RAW.Importer_${latest}_Mac.dmg"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
gh release download "$tag" --repo "$REPO" --pattern "$asset" --pattern "$asset.sha256" --dir "$work"
sha="$(sha256sum "$work/$asset" | cut -d' ' -f1)"
published="$(cut -d' ' -f1 "$work/$asset.sha256")"
if [[ "$sha" != "$published" ]]; then
  echo "checksum mismatch for $asset: $sha vs published $published" >&2
  exit 1
fi

sed -i.bak \
  -e "s/^  version \".*\"$/  version \"$latest\"/" \
  -e "s/^  sha256 \".*\"$/  sha256 \"$sha\"/" \
  "$CASK"
rm -f "$CASK.bak"
echo "$latest"
