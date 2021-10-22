#!/bin/sh
apk add dmg2img

TEMPLATE_VERSION=$(cat ../hydrus-release/version)

wget -O hydrus.dmg https://github.com/hydrusnetwork/hydrus/releases/download/v$(TEMPLATE_VERSION)/Hydrus.Network.$(TEMPLATE_VERSION).-.macOS.-.App.dmg
dmg2img hydrus.dmg hydrus.img
tar -xvf hydrus.img
ls
exit

TEMPLATE_HASH="TEST"
echo <<<EOF
cask "hydrus-network" do
  version "$TEMPLATE_VERSION"
  sha256 "$TEMPLATE_HASH"

  url "https://github.com/hydrusnetwork/hydrus/releases/download/v#{version}/Hydrus.Network.#{version}.-.macOS.-.App.dmg",
      verified: "github.com/hydrusnetwork/hydrus/"
  name "hydrus-network"
  desc "Personal booru-style media tagger to organize your media"
  homepage "https://hydrusnetwork.github.io/hydrus/"

  app "Hydrus Network.app"

  zap trash: [
    "~/Library/Hydrus/",
  ]
end
EOF