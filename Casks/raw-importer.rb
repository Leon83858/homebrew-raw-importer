cask "raw-importer" do
  version "3.0.0"
  sha256 "2b239cb2e410404cfae58e0670d721dc3d4f0fd27d29f825d54136af2c3a1be3"

  url "https://github.com/Leon83858/RAW_Importer/releases/download/v#{version}/RAW%20Importer_#{version}_Mac.dmg"
  name "RAW Importer"
  desc "Import camera RAW and image files into date-based folders"
  homepage "https://github.com/Leon83858/RAW_Importer"

  depends_on arch: :arm64
  depends_on :macos

  app "RAW Importer.app"

  uninstall quit: "com.projectbuilder.rawimportercs"

  caveats <<~EOS
    This app is unsigned and not notarized. If Gatekeeper blocks launch,
    Control-click the app in Applications and choose Open.
  EOS
end
