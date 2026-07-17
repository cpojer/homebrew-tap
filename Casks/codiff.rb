cask "codiff" do
  version "1.9.1"
  sha256 "8d3ef8d0604d6392ea23de5bbda311deea201dab49e69296dbc380b75809c73e"

  url "https://github.com/nkzw-tech/codiff/releases/download/v#{version}/Codiff-darwin-arm64-#{version}.zip"
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
