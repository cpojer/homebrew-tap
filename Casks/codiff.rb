cask "codiff" do
  version "1.0.0,1.0.0"
  sha256 "f05709e0c723269817f5db72af0a256077ad38ac2bd230da35364f63e3eee2f5"

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
