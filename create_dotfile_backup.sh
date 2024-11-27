#!/bin/bash

# Define backup base directories
SCRIPT_DIR="$(dirname $(realpath "$0"))"
BACKUP_FOLDER="$SCRIPT_DIR"

# Define source directories
DOTFILES_FOLDER=$(realpath ~/.config)
LOCAL_FOLDER=$(realpath ~/.local)

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
)

# Backup the files
for file in "${FILES_TO_BACKUP[@]}"; do
    echo "Backing up $file"
    rsync -vaP --relative "$file" "$BACKUP_FOLDER"
done
