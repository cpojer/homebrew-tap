cask "codiff" do
  version "0.7.0,0.7.0"
  sha256 "f9a6a10d96048ff9c1afe5f381b447ad57d92c53e3b2955dcc3b92a7377303fd"

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
