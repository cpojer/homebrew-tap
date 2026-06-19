cask "codiff" do
  version "1.4.3"
  sha256 "3f553a8e966b6e75916e6577d5fb1533d02bed510adad9ff9bf2ca17df6a67aa"

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
