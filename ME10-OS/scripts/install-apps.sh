#!/usr/bin/env bash
set -euo pipefail

for app in me-settings me-gaming-center me-ai me-security me-update-center me-performance; do
  chmod +x "/opt/me10/apps/$app/main.py" || true
done

cp -a /opt/me10/configs/kde/desktop/*.desktop /usr/share/applications/
update-desktop-database /usr/share/applications || true
