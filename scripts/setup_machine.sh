#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -eq 0 ]]; then
    echo "Do not run this as sudo">&2
    exit 1
fi

packages=(
    build-essential
    cmake
    curl
    git
    python3-serial
    python3-venv
    shellcheck
    socat
    tmux
)

sudo apt-get update
sudo apt-get install -y "${packages[@]}"

if id -nG "$USER" | grep -qw dialout; then
    echo "$USER is already in dialout"
else
    sudo usermod -aG dialout "$USER"
    echo "Added User to dialout, restart to see effects"
fi