#!/bin/sh

set -e

echo "Installing FVM..."
curl -fsSL https://fvm.app/install.sh | bash -s 3.2.1
export PATH="$PATH:$HOME/.pub-cache/bin"

echo "FVM version:"
fvm --version

echo "Installing Flutter version..."
fvm install

echo "Running 'fvm flutter pub get'..."
fvm flutter pub get

echo "Building Flutter Web..."
fvm flutter build web --release --base-href /