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
alias gitm="gita && gitc && gitpom"
alias configg="config add ~/.config && config commit -m 'i am batman' && config push origin master"
alias obs="cd ~/Library/Mobile\ Documents/iCLoud~md~obsidian/Documents/daini\ do\ nō && nvim"
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

export PATH="$HOME/.cargo/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
alias config='/usr/bin/git --git-dir=/Users/syx/.dotfiles.git/ --work-tree=/Users/syx'
export PATH="/Users/syx/Library/Python/3.13/bin:$PATH"

lazy_load() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:/Users/syx/Library/Python/3.13/bin:$PATH"
