#!/usr/bin/env bash
set -euo pipefail
install -d /usr/share/backgrounds/me10
cp /opt/me10/branding/wallpapers/ME-Dark-Aurora.svg /usr/share/backgrounds/me10/

echo me10-pc > /etc/hostname
