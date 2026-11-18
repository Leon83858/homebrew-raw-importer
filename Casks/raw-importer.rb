cask "raw-importer" do
  version "3.0.1"
  sha256 "b9518c9cde3d5fd469b60f8664cc8dd82a763d2ccbd669df57dd52dc6a7ce5d0"

  url "https://github.com/Leon83858/RAW_Importer/releases/download/v#{version}/RAW.Importer_#{version}_Mac.dmg"
  name "RAW Importer"
  desc "Import camera RAW and image files into date-based folders"
  homepage "https://github.com/Leon83858/RAW_Importer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "RAW Importer.app"

  uninstall quit: "com.projectbuilder.rawimportercs"

  caveats <<~EOS
    This app is unsigned and not notarized. If Gatekeeper blocks launch,
    Control-click the app in Applications and choose Open.
  EOS
end
