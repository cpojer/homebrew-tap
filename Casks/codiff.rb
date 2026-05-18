cask "codiff" do
  version "0.1.0"
  sha256 "f02027d3e3e138db03be393eb5da3b725a426d59d7d37b909fe2e4822e5770d7"

  url "https://github.com/nkzw-tech/codiff/releases/download/v#{version}/Codiff-darwin-arm64-#{version}.zip"
  name "Codiff"
  desc "Visual diff tool for Git changes"
  homepage "https://github.com/nkzw-tech/codiff"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Codiff.app"
  binary "#{appdir}/Codiff.app/Contents/Resources/app/bin/codiff-app",
         target: "codiff"

  zap trash: [
    "~/Library/Application Support/Codiff",
    "~/Library/Preferences/dev.nkzw-tech.codiff.plist",
    "~/Library/Saved Application State/dev.nkzw-tech.codiff.savedState",
  ]
end
