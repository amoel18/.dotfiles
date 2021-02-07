# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias py='python3'
alias t='tmux'
alias matlb='/home/i/.matlab/MATLAB/R2020b/bin/matlab -nodisplay'
alias fenics='conda activate fenicsproject'
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir --parents' # Make missing parent directories when creating folders.
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Grep with colors and ignore common directories.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal -I "*.aux" -I "*.log" -I "*.fls" -I "*.fdb_latexmk" -I "*.synctex.gz"' # List name of nodes.
alias la='ls -l --almost-all --si' # List nodes with their details.
alias x='sudo chmod +x'

alias open="xdg-open"
alias pins="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fi {1} | awk \"{print \$2}\")' | xargs -ro paru -S"

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias pa=' ps aux | grep'

# Custom Shortcuts
alias v='~/Downloads/nvim.appimage'
alias g='git'
alias e='exit'
alias tmux='tmux -f "$HOME/.tmux/tmux.conf"'
alias bwlogin='bw login --code "$(auth bitwarden)" "$(< ~/.mutt/accounts/com.gmail/email.txt)" "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.bitwarden/secret.gpg)"'
alias bwunlock='export BW_SESSION="$(bw unlock --raw $(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.bitwarden/secret.gpg))"'
alias pacman='sudo pacman'
alias rsync='rsync --protect-args --compress --verbose --progress --human-readable'
alias l="ledger balance '^assets' '^liabilities' --empty --flat"
alias le='$EDITOR ~/Sync/finance/journal-$(date +%Y).ledger'
alias lnet="ledger register '^expenses' '^income' --period 'this month' --subtotal --invert"
alias gen-npm='cp "$HOME/.config/npm/package.json" "package.json"'
alias gen-editorconfig='cp "$HOME/.editorconfig" ".editorconfig"'

# Global Aliases
alias -g L='| less'
alias -g G='| grep'
alias -g O='&|'


alias cd=' cd'
alias .=' cd'
alias ..=' cd ..;'
alias ...=' cd ..; cd ..;'
alias ....=' cd ..; cd ..; cd ..;'
alias cd..='..'
alias cd...='...'
alias cd....='....'
alias -g G='| grep '
alias -s PDF="zathura"
alias -s epub="open"
alias -s djuv="open"
alias -s pdf="zathura"
alias -s md=" v"
alias -s markdown="v"
alias -s htm="$BROWSER"
alias -s html="$BROWSER"
alias -s jar="java -jar"
alias -s war="java -jar"
alias -s deb="sudo dpkg -i"
alias -s gpg="gpg"

alias -s iso="vlc"
alias -s avi=" open"
alias -s AVI=" open"
alias -s mov=" open"
alias -s mpg=" open"
alias -s m4v=" open"
alias -s mp4=" open"
alias -s rmvb=" open"
alias -s MP4=" open"
alias -s ogg=" open"
alias -s ogv=" open"
alias -s flv=" open"
alias -s mkv=" open"
alias -s wav=" open"
alias -s mp3=" open"
alias -s webm=" open"

alias -s tif="open"
alias -s tiff="open"
alias -s png="open"
alias -s jpg="open"
alias -s jpeg="open"
alias -s JPG="open"
alias -s gif="open"
alias -s svg="open"
alias -s psd="open"

alias -s com="open"
alias -s de="open"
alias -s org="open"

alias -s rdf="rapper --count"
alias -s owl="rapper --count"
alias -s ttl="rapper -i turtle --count"
alias -s tt="rapper -i turtle --count"
alias -s n3="rapper -i turtle --count"
alias -s nq="rapper -i nquads --count"
alias -s nt="rapper -i ntriples --count"
alias -s ntriples="rapper -i ntriples --count"
alias -s ntriple="rapper -i ntriples --count"
alias -s trig="rapper -i trig --count"

alias -s ods="open"
alias -s xls="open"
alias -s xlsx="open"
alias -s csv="vd"

alias -s pot="open"
alias -s odt="open"
alias -s doc="open"
alias -s docx="open"
alias -s rtf="open"
alias -s dot="dot -Tpng -O"

alias -s ppt="open"
alias -s pptx="open"
alias -s odp="open"

alias -s plist="plutil"
alias -s log="open"

alias -s sla="open"

alias -s exe="open"

alias l="ls"
alias sl="ls"
alias lsd="ls"
alias la="ls -lah"
alias u="update"
alias gs="gst"


# git
foreach aliaskey (a b bl c co d ds dt dts f l r s sm w) {
	alias g$aliaskey="git $aliaskey"
}
unset aliaskey


alias diff='diff --color=auto'
 alias ip='ip -color=auto'

function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ./$1    ;;
          *.tar.gz)    tar xvzf ./$1    ;;
          *.tar.xz)    tar xvJf ./$1    ;;
          *.lzma)      unlzma ./$1      ;;
          *.bz2)       bunzip2 ./$1     ;;
          *.rar)       unrar x -ad ./$1 ;;
          *.gz)        gunzip ./$1      ;;
          *.tar)       tar xvf ./$1     ;;
          *.tbz2)      tar xvjf ./$1    ;;
          *.tgz)       tar xvzf ./$1    ;;
          *.zip)       unzip ./$1       ;;
          *.Z)         uncompress ./$1  ;;
          *.7z)        7z x ./$1        ;;
          *.xz)        unxz ./$1        ;;
          *.exe)       cabextract ./$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
