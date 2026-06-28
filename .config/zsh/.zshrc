zpptx() {
    if [[ -z "$1" || ! -f "$1" ]]; then
        echo "Usage: zpptx <presentation.pptx>"
        return 1
    fi
    
    echo "Converting $1 to PDF..."
    /Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf "$1"
    
    local filename="${1%.*}.pdf"
    zathura "$filename"
}

# completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

# Native Tetris setup
autoload -Uz tetriscurses
alias tetris="tetriscurses"

#other options
setopt append_history inc_append_history share_history

#Aliases
alias syncs="syncthing serve"
alias dbs="cd keybr.com && DB_CL=sqlite npm start"
alias gita="git add ."
alias gitc="git commit -m 'new add'"
alias gitpom="git push origin master"
alias gitpain="git push origin main"
alias gits="git status"
alias nv="nvim ."
alias gitt="gita && gitc && gitpain"
alias gitm="gita && gitc && gitpom"  # Preserved for master branches
alias configg="config add ~/.config && config commit -m 'i am batman' && config push origin master" # Preserved for master
alias obs="cd ~/Library/Mobile\ Documents/iCLoud~md~obsidian/Documents/daini\ do\ nō && nvim"
alias yz="yazi ~/Documents/eLibrary"
alias zu="cp ~/.zshrc ~/.config/zsh/.zshrc"
alias fonp="tailscale up && tailscale serve --bg 8000"
alias endt="tailscale serve reset && tailscale down"
alias conf="cd .config && nvim ."

alias work="countdown 60m"
alias rest="countdown 5m"

eval "$(starship init zsh)"
precmd_functions+=(set_block_cursor)
set_block_cursor() { printf '\033[2 q'; }

#eval "$(fzf --bash)"
source <(fzf --zsh)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
alias config='/usr/bin/git --git-dir=/Users/syx/.dotfiles.git/ --work-tree=/Users/syx'

# NVM Lazy Loading Environment & Aliases
export NVM_DIR="$HOME/.nvm"
lazy_nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
alias nvm='lazy_nvm; nvm'
alias node='lazy_nvm; node'
alias npm='lazy_nvm; npm'
alias npx='lazy_nvm; npx'

# Consolidated Global Path
export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:/Users/syx/Library/Python/3.13/bin:$PATH"
