#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$HOME"/{Documents,Downloads,Pictures,Music,Videos,Games,Projects,Clips,Screenshots}
mkdir -p "$HOME/Desktop"
cat > "$HOME/Desktop/Welcome to ME.10.txt" <<TXT
Welcome to ME.10 Pro.
A futuristic Linux-based operating system created by Mohamed Elbouihi.
TXT
rm -f "$HOME/.config/autostart/me-first-boot.desktop"
