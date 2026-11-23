cask "ark" do
  version "0.24.0"
  sha256 "5d397ae3da37649f701f1db72e5d4ec052239e08555be64c376aed1c93dea8bd"

  url "https://relay.cloudbluedigital.co.uk/r/downloads/ark/#{version}/darwin-dmg/arm64"
  name "Ark"
  desc "Native local development environment for any stack"
  homepage "https://ark.cloudbluedigital.co.uk/"

  livecheck do
    url "https://relay.cloudbluedigital.co.uk/r/downloads/ark/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Ark.app"

  uninstall launchctl: "com.cloudbluedigital.arkd",
            quit:      "com.cloudbluedigital.ark"

  zap trash: [
    "~/.ark",
    "~/Library/Application Support/com.cloudbluedigital.ark",
    "~/Library/Caches/com.cloudbluedigital.ark",
    "~/Library/Preferences/com.cloudbluedigital.ark.plist",
    "~/Library/Saved Application State/com.cloudbluedigital.ark.savedState",
    "~/Library/WebKit/com.cloudbluedigital.ark",
  ]

  caveats <<~EOS
    On first run Ark sets up local DNS for .test addresses and a trusted
    certificate. Those live outside the app, so run

      sudo ark uninstall

    before `brew uninstall --cask ark` to undo them. Your data in ~/.ark is
    kept unless you run `sudo ark uninstall --purge` or `brew uninstall --zap`.
  EOS
end
