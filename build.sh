#!/bin/sh

set -e

echo "Installing FVM..."
dart pub global activate fvm

export PATH="$PATH":"$HOME/.pub-cache/bin"

echo "FVM version:"
fvm --version

echo "Installing Flutter version..."
fvm install

echo "Running 'fvm flutter pub get'..."
fvm flutter pub get

echo "Building Flutter Web..."
fvm flutter build web --release --base-href /