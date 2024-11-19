# https://github.com/ohmyzsh/ohmyzsh/wiki/
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fishy"
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search auto-notify sudo git history)


bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

source $ZSH/oh-my-zsh.sh

bindkey '^H' backward-kill-word
bindkey '5~' kill-word
# zstyle ':omz:update' mode auto      # update automatically without asking

alias checksync='./Scripts/checksync.sh'
