#!/bin/sh

set -e

echo "Checking for prebuilt Flutter Web artifacts..."
if [ -d "build/web" ] && [ -f "build/web/index.html" ]; then
  echo "Found prebuilt web at build/web. Skipping build."
  exit 0
fi

echo "Error: build/web not found. Cloudflare build environment blocks executing custom binaries required to compile Flutter."
echo "Please build locally/CI and commit or upload the build artifacts to build/web, or deploy via CI using wrangler pages deploy."
exit 1