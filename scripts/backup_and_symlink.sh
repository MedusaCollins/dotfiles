#!/bin/bash

backup_and_symlink() {
    local ldotfiles="$HOME/Documents/dotfiles"
    local backupFolder="$HOME/Backups"
    mkdir -p "$backupFolder"

    local backedUp=()
    local symlinked=()

    declare -A DOTFILES_AND_FOLDERS
    DOTFILES_AND_FOLDERS=( 
        [".config/btop"]="$HOME/.config/btop"
        [".config/hypr"]="$HOME/.config/hypr"
        [".config/neofetch"]="$HOME/.config/neofetch"
        [".config/rebos"]="$HOME/.config/rebos"
        [".config/rofi"]="$HOME/.config/rofi"
        [".config/waybar"]="$HOME/.config/waybar"
        [".config/kitty"]="$HOME/.config/kitty"
        [".config/dunst"]="$HOME/.config/dunst"
        [".config/nvim"]="$HOME/.config/nvim"
        ["Pictures"]="$HOME/Pictures"
        [".oh-my-zsh"]="$HOME/.oh-my-zsh"
        [".bashrc"]="$HOME/.bashrc"
        [".zshrc"]="$HOME/.zshrc"
    )

    if [[ "$backupFolder" == "$HOME/.oh-my-zsh"* ]] || [[ "$backupFolder" == "$HOME/Pictures"* ]]; then
        echo "Yedekleme klasörü hedef dizinin içinde yer alıyor. Döngüsel yedekleme hatası."
        return 1
    fi

    for item in "${!DOTFILES_AND_FOLDERS[@]}"; do
        local target="${DOTFILES_AND_FOLDERS[$item]}"
        
        if [ -e "$target" ] || [ -L "$target" ]; then
            local backupPath="$backupFolder/${item}.backup"
            
            if [ -d "$target" ]; then
                if [[ "$target" == "$backupFolder"* ]]; then
                    echo "Skipping $target because it overlaps with backup folder."
                    continue
                fi

                backupPath="$backupFolder/${item}.backup"
                mkdir -p "$(dirname "$backupPath")"
                mv "$target" "$backupPath"
                backedUp+=("$item (directory)")
            else
                mkdir -p "$(dirname "$backupPath")"
                mv "$target" "$backupPath"
            fi
        fi

        if [ -L "$target" ]; then
            rm "$target"
        fi

        ln -s "$ldotfiles/$item" "$target"
        symlinked+=("$item")
    done

    echo "Yedeklenen dosyalar:"
    for file in "${backedUp[@]}"; do
        echo "- $file"
    done

    echo ""
    echo "Sembolik bağlantı oluşturulan dosyalar:"
    for file in "${symlinked[@]}"; do
        echo "- $file"
    done
}
