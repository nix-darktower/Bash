#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="/install_data/Saved/$USER/bash/bash-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP_DIR"

for file in \
    .bashrc \
    .bash_aliases \
    .bash_functions \
    .bash_logout \
    .bash_profile \
    .gitconfig
do
    if [ -f "$HOME/$file" ]; then
        cp -a "$HOME/$file" "$BACKUP_DIR/"
    fi

    cp -a "$SCRIPT_DIR/$file" "$HOME/$file"
done

echo "Configuration installed."
echo "Previous files backed up to:"
echo "$BACKUP_DIR"
