# Homebrew Tap for RAW Importer

Install RAW Importer on Apple Silicon Macs:

```sh
brew tap Leon83858/homebrew-raw-importer
brew trust --cask leon83858/raw-importer/raw-importer
brew install --cask raw-importer
```

The trust command trusts only this cask's Homebrew package definition; it does not bypass macOS Gatekeeper. It downloads the macOS DMG from the RAW Importer GitHub release. The app is currently unsigned and not notarized, so macOS may block its first launch. If you trust the download, Control-click **RAW Importer** in Applications and choose **Open**, or use **Open Anyway** in **System Settings > Privacy & Security**.
