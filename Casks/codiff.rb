cask "codiff" do
  version "0.8.0,0.8.0"
  sha256 "382bf65ea17f7db30d7a124ecb259379b8eb65f9ba221ab341a80d6f92af1d6d"

  url "https://github.com/nkzw-tech/codiff/releases/download/v#{version.csv.second}/Codiff-darwin-arm64-#{version.csv.first}.zip"
  name "Codiff"
  desc "Visual diff tool for Git changes"
  homepage "https://github.com/nkzw-tech/codiff"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Codiff.app"
  binary "#{appdir}/Codiff.app/Contents/Resources/app/bin/codiff-app",
         target: "codiff"

  zap trash: [
    "~/Library/Application Support/Codiff",
    "~/Library/Preferences/dev.nkzw-tech.codiff.plist",
    "~/Library/Saved Application State/dev.nkzw-tech.codiff.savedState",
  ]
end
