# Build Guide

## 1) Install dependencies
```bash
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools dosfstools shellcheck python3
```

## 2) Build
```bash
cd /workspace/ME10/ME10-OS
./clean.sh
./build.sh
```

## 3) Output
```bash
ls -lh dist/ME.10-Pro-1.0.iso
```

## 4) Validate live-build tree
```bash
test -x live-build-config/auto/config
test -d live-build-config/config/hooks/live
test -d live-build-config/config/archives
```
