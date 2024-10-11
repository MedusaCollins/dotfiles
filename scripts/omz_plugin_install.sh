#!/bin/bash

omz_plugin_install() {
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/Documents/dotfiles/.oh-my-zsh/custom}"
    local PLUGIN_DIR="$ZSH_CUSTOM/plugins"

    declare -A PLUGINS
    PLUGINS=(
        ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
        ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
        ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search"
        ["auto-notify"]="https://github.com/MichaelAquilina/zsh-auto-notify"
    )

    for plugin in "${!PLUGINS[@]}"; do
        local pluginPath="$PLUGIN_DIR/$plugin"

        if [ ! -d "$pluginPath" ]; then
            echo "Plugin '$plugin' not found, cloning from ${PLUGINS[$plugin]}..."
            git clone "${PLUGINS[$plugin]}" "$pluginPath"
            echo "Plugin '$plugin' successfully cloned into $pluginPath."
        else
            echo "Plugin '$plugin' already exists at $pluginPath."
        fi
    done
}
