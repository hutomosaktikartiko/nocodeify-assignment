#!/bin/sh

set -e

echo "Installing FVM (no sudo)..."
# Install FVM locally to user home to avoid creating system symlinks
FVM_VERSION="3.2.1"
FVM_DIR="$HOME/.fvm_flutter"
FVM_BIN="$FVM_DIR/bin"
mkdir -p "$FVM_BIN"

# Resolve OS/ARCH for FVM binary
OS="$(uname -s)"
case "$OS" in
  Linux) OS_TAG="linux" ;;
  Darwin) OS_TAG="macos" ;;
  *) echo "Unsupported OS: $OS"; exit 1 ;;
esac
ARCH="$(uname -m)"
case "$ARCH" in
  x86_64|amd64) ARCH_TAG="x64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

FVM_TARBALL_URL="https://github.com/leoafarias/fvm/releases/download/${FVM_VERSION}/fvm-${FVM_VERSION}-${OS_TAG}-${ARCH_TAG}.tar.gz"
echo "Downloading FVM from: $FVM_TARBALL_URL"
curl -fsSL "$FVM_TARBALL_URL" | tar -xz -C "$FVM_BIN"
chmod +x "$FVM_BIN/fvm"

# Ensure FVM and pub cache are in PATH
export PATH="$FVM_BIN:$HOME/.pub-cache/bin:$PATH"

echo "FVM version:"
fvm --version

echo "Installing Flutter version..."
fvm install

echo "Running 'fvm flutter pub get'..."
fvm flutter pub get

echo "Building Flutter Web..."
fvm flutter build web --release --base-href /