# Homebrew Tap for RAW Importer

Install RAW Importer on Apple Silicon Macs:

```sh
brew tap Leon83858/homebrew-raw-importer
brew trust --cask leon83858/raw-importer/raw-importer
brew install --cask raw-importer
```

The trust command approves only this cask. It downloads the macOS DMG from the RAW Importer GitHub release. The app is currently unsigned and not notarized.
