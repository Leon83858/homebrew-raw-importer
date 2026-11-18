# Homebrew Tap for RAW Importer

Install RAW Importer on Apple Silicon Macs:

```sh
brew tap Leon83858/homebrew-raw-importer
brew trust --cask leon83858/raw-importer/raw-importer
brew install --cask raw-importer
```

To update to the newest version:

```sh
brew update && brew upgrade --cask raw-importer
```

The cask follows the newest RAW Importer release automatically: the "Update cask" workflow checks for a new release every 6 hours (and right after each release), verifies the DMG against its published SHA-256 checksum and updates the version.

The trust command approves only this cask. It downloads the macOS DMG from the RAW Importer GitHub release. The app is currently unsigned and not notarized.
