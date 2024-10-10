# Yedeklerin saklanacağı klasör
ldotfiles="$HOME/Documents/Github/dotfiles"
backupFolder="$HOME/Backups"
mkdir -p "$backupFolder"

# Dotfiles ve dotfolders
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

# Sembolik bağları oluşturma fonksiyonu
for item in "${!DOTFILES_AND_FOLDERS[@]}"; do
    target="${DOTFILES_AND_FOLDERS[$item]}"
    
    # Eğer hedef bir dosya ya da dizinse yedek alıyoruz
    if [ -e "$target" ]; then
        backupPath="$backupFolder/${item}.backup"
        mkdir -p "$(dirname "$backupPath")" # Yedek dizinlerinin mevcut olduğundan emin ol
        mv "$target" "$backupPath"
        echo "Backed up existing $item to $backupPath"
    fi
    
    # Sembolik bağlantı oluşturma
    ln -s "$ldotfiles/$item" "$target"
    echo "Created symlink for $item -> $target"
done
