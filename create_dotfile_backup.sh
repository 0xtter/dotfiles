#!/bin/bash

BACKUP_FOLDER="$(dirname $(realpath "$0"))/config"
DOTFILES_FOLDER=$(realpath ~/.config)

FOLDERS_TO_BACKUP=( "$DOTFILES_FOLDER/cava" "$DOTFILES_FOLDER/dolphinrc" "$DOTFILES_FOLDER/kitty" "$DOTFILES_FOLDER/nautilus" "$DOTFILES_FOLDER/rofi" "$DOTFILES_FOLDER/hypr" )

for file in "${FOLDERS_TO_BACKUP[@]}"; do
    echo "$file"
    rsync -vaP "$file" "$BACKUP_FOLDER"
done