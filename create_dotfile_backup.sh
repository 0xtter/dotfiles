#!/bin/bash

# Define backup base directories
SCRIPT_DIR="$(dirname $(realpath "$0"))"
BACKUP_FOLDER="$SCRIPT_DIR"

# Define source directories
HOME_FOLDER=$(realpath ~)
DOTFILES_FOLDER="$HOME_FOLDER/.config"
LOCAL_FOLDER="$HOME_FOLDER/.local"

# Define the folders and files to backup with their base directories
FILES_TO_BACKUP=(
    "$DOTFILES_FOLDER/cava"
    "$DOTFILES_FOLDER/dolphinrc"
    "$DOTFILES_FOLDER/kitty"
    "$DOTFILES_FOLDER/nautilus"
    "$DOTFILES_FOLDER/rofi"
    "$DOTFILES_FOLDER/hypr"
    "$LOCAL_FOLDER/bin/play-previous"
    "$LOCAL_FOLDER/bin/play-next"
    "$LOCAL_FOLDER/bin/spotify-pause"
    "$LOCAL_FOLDER/bin/player-pause"
    "$HOME_FOLDER/.zshrc"
)

# Backup the files
for file in "${FILES_TO_BACKUP[@]}"; do
    echo "Backing up $file"
    rsync -vaP --relative "$file" "$BACKUP_FOLDER"
done
