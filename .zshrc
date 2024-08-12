# https://github.com/ohmyzsh/ohmyzsh/wiki/
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fishy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search sudo copydir history jsontools auto-notify)

source $ZSH/oh-my-zsh.sh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
