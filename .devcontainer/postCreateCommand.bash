#!/usr/bin/env bash

set -euo pipefail

# Install apple/swift-format
cd /workspaces/swift-format
VERSION=508.0.0  # replace this with the version you need
if [ ! -d "swift-format" ]; then
  git clone https://github.com/apple/swift-format.git
fi
cd swift-format
git checkout "tags/$VERSION"
swift build -c release
cp .build/release/swift-format /usr/local/bin/
which swift-format
cd /workspaces/VaporDevcontainer
