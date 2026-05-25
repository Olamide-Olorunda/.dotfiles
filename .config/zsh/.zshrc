zpptx() {
    if [[ -z "$1" || ! -f "$1" ]]; then
        echo "Usage: zpptx <presentation.pptx>"
        return 1
    fi
    
    echo "Converting $1 to PDF..."
    # Use LibreOffice in headless mode to convert the file
    /Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf "$1"
    
    # Extract filename without extension and open the new PDF
    local filename="${1%.*}.pdf"
    zathura "$filename"
}
alias syncs="syncthing serve"
alias dbs="cd keybr.com && DB_CL=sqlite npm start"
alias gita="git add ."
alias gitc="git commit -m 'new add'"
alias gitpom="git push origin main"
alias gits="git status"
alias nv="nvim ."
alias gitt="gita && gitc && gitpom"
alias configg="config add ~/.config && config commit -m 'new add' && config push origin master"


eval "$(starship init zsh)"
precmd_functions+=(set_block_cursor)
set_block_cursor() { printf '\033[2 q'; }

export PATH="$HOME/.cargo/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
alias config='/usr/bin/git --git-dir=/Users/syx/.dotfiles.git/ --work-tree=/Users/syx'
