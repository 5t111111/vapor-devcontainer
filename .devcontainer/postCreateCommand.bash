#!/usr/bin/env bash

set -euo pipefail

APP_DIR=/workspaces/vapor-devcontainer
SRC_DIR=/workspaces/src

# Install Vapor Toolbox
VAPOR_TOOLBOX_VERSION="18.7.1"
cd $SRC_DIR
if [ ! -d "toolbox" ]; then
  git clone https://github.com/vapor/toolbox.git
fi
cd toolbox
git checkout "tags/$VAPOR_TOOLBOX_VERSION"
make install
which vapor

# Install apple/swift-format
SWIFT_FORMAT_VERSION="508.0.0"
cd $SRC_DIR
if [ ! -d "swift-format" ]; then
  git clone https://github.com/apple/swift-format.git
fi
cd swift-format
git checkout "tags/$SWIFT_FORMAT_VERSION"
swift build -c release
cp .build/release/swift-format /usr/local/bin/
which swift-format

cd $APP_DIR
