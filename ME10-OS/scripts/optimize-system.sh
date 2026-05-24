#!/usr/bin/env bash
set -e
sudo sysctl -w vm.swappiness=10 || true
sudo systemctl enable fstrim.timer || true
