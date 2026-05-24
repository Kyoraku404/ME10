#!/usr/bin/env bash
set -euo pipefail

ISO_NAME="ME.10-Pro-1.0.iso"
OUT_DIR="dist"
WORK_DIR=".build/live-build"
LB_SRC="live-build-config"

sudo apt-get update
sudo apt-get install -y live-build debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools dosfstools

rm -rf "$WORK_DIR"
mkdir -p "$WORK_DIR"
cp -a "$LB_SRC"/. "$WORK_DIR"/

mkdir -p "$WORK_DIR/config/package-lists"
cat packages/base-packages.txt \
    packages/desktop-packages.txt \
    packages/gaming-packages.txt \
    packages/creator-packages.txt \
    packages/dev-packages.txt \
    > "$WORK_DIR/config/package-lists/me10.list.chroot"

mkdir -p "$WORK_DIR/config/includes.chroot/opt/me10"
cp -a branding themes configs apps scripts "$WORK_DIR/config/includes.chroot/opt/me10/"
cp -a bin "$WORK_DIR/config/includes.chroot/usr/local/"

chmod +x "$WORK_DIR/auto/config" "$WORK_DIR/auto/build"

pushd "$WORK_DIR" >/dev/null
lb clean --purge || true
lb config
lb build
popd >/dev/null

mkdir -p "$OUT_DIR"
cp "$WORK_DIR/live-image-amd64.hybrid.iso" "$OUT_DIR/$ISO_NAME"
echo "Built ISO: $OUT_DIR/$ISO_NAME"
