cask "codiff" do
  version "0.10.0,0.10.0-5"
  sha256 "6e3d683c548f1192db1278e859ea05f12099fe655a9997b0e2f9eafe44187059"

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
