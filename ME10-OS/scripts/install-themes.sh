#!/usr/bin/env bash
set -euo pipefail

install -d /usr/share/plymouth/themes/me10
cp /opt/me10/themes/plymouth/me10.plymouth /usr/share/plymouth/themes/me10/
cp /opt/me10/themes/plymouth/me10.script /usr/share/plymouth/themes/me10/
plymouth-set-default-theme -R me10 || true

install -d /usr/share/sddm/themes/me10
cp -a /opt/me10/themes/sddm/me10/* /usr/share/sddm/themes/me10/
mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/me10.conf <<CFG
[Theme]
Current=me10
CFG

cat > /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc <<PLASMA
[Containments][1][General]
wallpaper=/usr/share/backgrounds/me10/ME-Dark-Aurora.svg
PLASMA
