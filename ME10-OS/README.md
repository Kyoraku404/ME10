# ME.10 Pro 1.0 (Build 2026.05)

ME.10 Pro is an Ubuntu 24.04 LTS (Noble) + KDE Plasma live distribution project with ME branding, custom launcher apps, gaming tooling, and live-build automation.

## Build prerequisites (Ubuntu host)
```bash
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools dosfstools shellcheck python3
```

## Build ISO
```bash
cd /workspace/ME10/ME10-OS
./clean.sh
./build.sh
```
Expected output:
`dist/ME.10-Pro-1.0.iso`

## Test in VirtualBox
```bash
VBoxManage createvm --name "ME10-Pro" --register
VBoxManage modifyvm "ME10-Pro" --memory 8192 --cpus 4 --vram 128 --graphicscontroller vmsvga --accelerate3d on --firmware efi
VBoxManage storagectl "ME10-Pro" --name "SATA" --add sata --controller IntelAhci
VBoxManage createhd --filename "$HOME/VirtualBox VMs/ME10-Pro/ME10-Pro.vdi" --size 65536
VBoxManage storageattach "ME10-Pro" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/ME10-Pro/ME10-Pro.vdi"
VBoxManage storageattach "ME10-Pro" --storagectl "SATA" --port 1 --device 0 --type dvddrive --medium /workspace/ME10/ME10-OS/dist/ME.10-Pro-1.0.iso
VBoxManage startvm "ME10-Pro"
```

## Features wired now
- live-build Ubuntu Noble ISO pipeline
- custom ME apps in launcher (.desktop entries)
- first-boot folder + welcome file creation
- SDDM/Plymouth/wallpaper integration scripts
- mefetch command in `/usr/local/bin/mefetch`

## Notes
This repository includes functional configuration and script wiring first; premium binary visual/audio assets can be replaced in `branding/` and `themes/` without changing build flow.
