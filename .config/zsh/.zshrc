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
alias configg="config add ~/.config && config commit -m 'i am batman' && config push origin master"
alias obs="cd ~/Library/Mobile\ Documents/iCLoud~md~obsidian/Documents/daini\ do\ nō && nvim"

eval "$(starship init zsh)"
precmd_functions+=(set_block_cursor)
set_block_cursor() { printf '\033[2 q'; }


alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -ignoreDnD
        -sound Crystal"

alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -ignoreDnD
        -sound Crystal"



export PATH="$HOME/.cargo/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
alias config='/usr/bin/git --git-dir=/Users/syx/.dotfiles.git/ --work-tree=/Users/syx'
export PATH="/Users/syx/Library/Python/3.13/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

