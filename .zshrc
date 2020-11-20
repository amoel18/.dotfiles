#!/usr/bin/env zsh

# auto start tmux
if [ "$TMUX" = "" ]; then
    # check for old session
    if [ "$(tmux ls | grep -v attached | wc -l)" -gt "0" ]; then
        # attach to old session
        tmux a -t "$(tmux ls | grep -v attached | cut -d ":" -f1 | head -n 1)"
    else
        # start new session - dont use exec so it's possible to run without tmux
        tmux
    fi
fi

autoload -U compinit
compinit -d ~/.zsh/.zcompdump
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

autoload -U promptinit; promptinit
# yarn
[[ $PATH =~ $HOME/.yarn/bin ]] || PATH=$(yarn global bin):$PATH
WORDCHARS=''

# golang
export GOPATH=$HOME/WorkSpaces/go
# [[ $PATH =~ $GOPATH/bin ]] || PATH=$(go env GOPATH)/bin:$PATH

# path
[[ $PATH =~ $HOME/.local/bin ]] || PATH=$HOME/.local/bin:$PATH
export PATH

export JDK_HOME=/usr/lib/jvm/default

# emacs mode
bindkey -v

FAST_ALIAS_TIPS_PREFIX=" ¡ $(tput bold)"

# tabs size
tabs 4

zmodload -i zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager \
        (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

ZSH_LPLUG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/lplug
source ~/.zinit/bin/zinit.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
zinit wait lucid for \
    zdharma/fast-syntax-highlighting \
    atload='!_zsh_autosuggest_start' zsh-users/zsh-autosuggestions \
    blockf zsh-users/zsh-completions

_ZL_NO_ALIASES=1
zinit lucid wait for \
    as='program' src='z.lua.plugin.zsh' skywind3000/z.lua \
    hlissner/zsh-autopair

zinit light-mode for \
    kutsan/zsh-system-clipboard \
    skywind3000/z.lua \
    aloxaf/fzf-tab \
    zpm-zsh/clipboard \
    mafredri/zsh-async \
    kevinhwang91/zsh-tmux-capture \
    junegunn/fzf-bin \
    junegunn/fzf


zinit light zsh-users/zsh-completions
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips
zinit light MichaelAquilina/zsh-emojis
#zinit light marlonrichert/zsh-autocomplete

#zstyle ':autocomplete:tab:*' fzf-completion yes
#zinit light djui/alias-tips


zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions

#export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
#zinit light zdharma/fast-syntax-highlighting


#bindkey '^ ' autosuggest-accept



omz_plugins=(
    git
    thefuck
    yarn
)
for plugin in ${omz_plugins[@]}; do
    zinit snippet OMZ::plugins/$plugin/$plugin.plugin.zsh
done
source $ZSH_LPLUG_DIR/completion.zsh
source $ZSH_LPLUG_DIR/misc.zsh
source $ZSH_LPLUG_DIR/color.zsh
source $ZSH_LPLUG_DIR/history.zsh
source $ZSH_LPLUG_DIR/alias-function.zsh
source $ZSH_LPLUG_DIR/theme.zsh
source $ZSH_LPLUG_DIR/git-prompt.zsh
source $ZSH_LPLUG_DIR/tmux.zsh
source $ZSH_LPLUG_DIR/fzf-plugin.zsh


# python prompt toolkit color depth
export PROMPT_TOOLKIT_COLOR_DEPTH=DEPTH_24_BIT

# less
export LESS=FKMRX

# ranger
if (( $+commands[ranger] )); then
    export RANGER_LOAD_DEFAULT_RC=FALSE
fi

# neovim
if (( $+commands[nvim] )); then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'
fi

# bat
if (( $+commands[bat] )); then
    export BAT_THEME=TwoDark
    export BAT_STYLE=plain
fi

# Make a directory and cd into it
function take {
    mkdir -p $1
    cd $1
}
function open_command() {
  emulate -L zsh
  setopt shwordsplit

  local open_cmd

  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd='open' ;;
    cygwin*)  open_cmd='cygstart' ;;
    linux*)   open_cmd='xdg-open' ;;
    msys*)    open_cmd='start ""' ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac
  # don't use nohup on OSX
  if [[ "$OSTYPE" == darwin* ]]; then
    $open_cmd "$@" &>/dev/null
  else
    nohup $open_cmd "$@" &>/dev/null
  fi
}
# Show dots while waiting for tab-completion
expand-or-complete-with-dots() {
    # toggle line-wrapping off and back on again
    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
    print -Pn "%{%F{red}......%f%}"
    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam

    zle expand-or-complete
    zle redisplay
}
alias ll="ls --color=auto -la"
alias lsport="sudo lsof -i"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias {yaourt,yay}="yay"
alias open="xdg-open"

#alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# android related aliases
alias aroot="adb shell su -c"
alias admesg="adb shell su -c dmesg"
alias alog="adb logcat"
alias e="exit"
# Sorts directories in top, colors, and prints `/` at directories:
#alias ls="/usr/local/bin/gls --color -h --group-directories-first -F"

# `bat` styling:
alias bat="\bat --theme=GitHub"

# Pretty print XML (use `jq` for json):
alias xq="xmllint --format"

alias d='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias cfg='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
alias da='d add'
alias ds='d status'
alias dc='d commit -m "a"'
alias dp='d push'
alias v="nvim"
alias e="exit"
alias open='xdg-open'
alias ls=' exa --group-directories-first --all'
alias vs="clear; exa --git -h -l --group-directories-first --time-style long-iso --color automatic"
alias p=' ps aux | grep'
alias cd=' cd'
alias .=' cd'
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'
alias -g G='| grep '
alias -s PDF="okular"
alias -s epub="open"
alias -s djuv="open"
alias -s pdf="okular"
alias -s md=" nvim"
alias -s markdown="nvim"
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

#wrap alias'

alias -s tjp="tj3"
alias -s asc="gpg"
alias -s pem="openssl x509 -noout -text -in "
alias sourcetree='open -a SourceTree'

alias -s xml="xmllint --format"
#alias sudo="sudo "
alias suspend="sudo systemctl suspend"
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias halt="sudo systemctl halt"
alias sl="ls"
alias lsd="ls"



# htop is better
alias top="htop"

# Vim like alias
alias :q="exit"

# Avoid typos
alias ake="make"

# cake is way more stylish than cmake
alias cake="cmake"

# My pdf reader
alias pdf="zathura"

# Show local ip:

setopt histignorespace
setopt autopushd
setopt extendedhistory

# Autocorrection
setopt correct

setopt correctall
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursors
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Save history immediately
setopt incappendhistory
# Share history accross terms
setopt sharehistory
# Append history instead of overwriting
setopt appendhistory
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a succesive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.


#-----------------------------
# Colors
#-----------------------------
[[ -r $XDG_CONFIG_HOME/LS_COLORS/LS_COLORS ]] && {
    eval $(dircolors -b $XDG_CONFIG_HOME/LS_COLORS/LS_COLORS)
}

#------------------------------
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

#prompt_newline='%666v'
#PROMPT="$PROMPT"


bindkey -r "^S"
bindkey -r "^D"
bindkey -r "^E"
bindkey "^S" backward-word
bindkey "^D" forward-word
zle -N autosuggest-execute
bindkey "^E" autosuggest-execute
bindkey "^ " end-of-line
#export $ZINIT=home/i/.zinit/plugins

#export FZF_DEFAULT_COMMAND='fd --hidden --type file --no-ignore --exclude --color=always "/.git/"'
#export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --no-border --multi --color=always'

#export FZF_DEFAULT_OPTS='--ansi --multi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


source $HOME/.zinit/plugins/junegunn---fzf/shell/key-bindings.zsh
source $HOME/.zinit/plugins/junegunn---fzf/shell/completion.zsh
#zstyle ":completion:*:git-checkout:*" sort false
#zstyle ':completion:*:descriptions' format '[%d]'
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-preview 'exa -1 --color=always $realpath'
#source fzf.zsh
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# Ignore this shit
zstyle ':completion:*' ignored-patterns 'DevToolsSecurity|dev_mkdb'

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

#source fzf-tmux
enable-fzf-tab


# Use caching to make completion for cammands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
if zstyle -t ':prezto:module:completion:*' case-sensitive; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  setopt CASE_GLOB
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unsetopt CASE_GLOB
fi

# Group matches and describe.
 zstyle ':completion:*:*:*:*:*' menu select
 zstyle ':completion:*:matches' group 'yes'
 zstyle ':completion:*:options' description 'yes'
 zstyle ':completion:*:options' auto-description '%d'
 zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
 zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
 zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
 zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
 zstyle ':completion:*' group-name ''
 zstyle ':completion:*' verbose yes
PURE_PROMPT_SYMBOL=" "
PURE_PROMPT_VICMD_SYMBOL=" "
# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order local-directories directory-stack path-directories

# Directories
zstyle ':completion:*:default' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single


# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
export SUDO_ASKPASS=~/bin/utils/rofi-askpass
export FZF_DEFAULT_COMMAND='rg --hidden  --ignore .git -g ""'


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Jump to beginning using H and the end using L in NORMAL mode
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

# Open current command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

if (( $+commands[yaourt] )); then
  alias yaconf='yaourt -C'
  alias yaupg='yaourt -Syua'
  alias yasu='yaourt -Syua --noconfirm'
  alias yain='yaourt -S'
  alias yains='yaourt -U'
  alias yare='yaourt -R'
  alias yarem='yaourt -Rns'
  alias yarep='yaourt -Si'
  alias yareps='yaourt -Ss'
  alias yaloc='yaourt -Qi'
  alias yalocs='yaourt -Qs'
  alias yalst='yaourt -Qe'
  alias yaorph='yaourt -Qtd'
  alias yainsd='yaourt -S --asdeps'
  alias yamir='yaourt -Syy'


  if (( $+commands[abs] && $+commands[aur] )); then
    alias yaupd='yaourt -Sy && sudo abs && sudo aur'
  elif (( $+commands[abs] )); then
    alias yaupd='yaourt -Sy && sudo abs'
  elif (( $+commands[aur] )); then
    alias yaupd='yaourt -Sy && sudo aur'
  else
    alias yaupd='yaourt -Sy'
  fi
fi

if (( $+commands[yay] )); then
  alias yaconf='yay -Pg'
  alias yaupg='yay -Syu'
  alias yasu='yay -Syu --noconfirm'
  alias yain='yay -S'
  alias yains='yay -U'
  alias yare='yay -R'
  alias yarem='yay -Rns'
  alias yarep='yay -Si'
  alias yareps='yay -Ss'
  alias yaloc='yay -Qi'
  alias yalocs='yay -Qs'
  alias yalst='yay -Qe'
  alias yaorph='yay -Qtd'
  alias yainsd='yay -S --asdeps'
  alias yamir='yay -Syy'


  if (( $+commands[abs] && $+commands[aur] )); then
    alias yaupd='yay -Sy && sudo abs && sudo aur'
  elif (( $+commands[abs] )); then

    alias yaupd='yay -Sy && sudo abs'
  elif (( $+commands[aur] )); then
    alias yaupd='yay -Sy && sudo aur'
  else
    alias yaupd='yay -Sy'
  fi
fi

if (( $+commands[pacaur] )); then
  alias paupg='pacaur -Syu'
  alias pasu='pacaur -Syu --noconfirm'
  alias pain='pacaur -S'
  alias pains='pacaur -U'
  alias pare='pacaur -R'
  alias parem='pacaur -Rns'
  alias parep='pacaur -Si'
  alias pareps='pacaur -Ss'
  alias paloc='pacaur -Qi'
  alias palocs='pacaur -Qs'
  alias palst='pacaur -Qe'
  alias paorph='pacaur -Qtd'
  alias painsd='pacaur -S --asdeps'
  alias pamir='pacaur -Syy'

  if (( $+commands[abs] && $+commands[aur] )); then
    alias paupd='pacaur -Sy && sudo abs && sudo aur'
  elif (( $+commands[abs] )); then
    alias paupd='pacaur -Sy && sudo abs'
  elif (( $+commands[aur] )); then
    alias paupd='pacaur -Sy && sudo aur'
  else
    alias paupd='pacaur -Sy'
  fi
fi

if (( $+commands[trizen] )); then
  function upgrade() {
    trizen -Syu
  }
elif (( $+commands[pacaur] )); then
  function upgrade() {
    pacaur -Syu
  }
elif (( $+commands[yaourt] )); then
  function upgrade() {
    yaourt -Syu
  }
elif (( $+commands[yay] )); then
  function upgrade() {
    yay -Syu
  }
else
  function upgrade() {
    sudo pacman -Syu
  }
fi

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'


if (( $+commands[abs] && $+commands[aur] )); then
  alias pacupd='sudo pacman -Sy && sudo abs && sudo aur'
elif (( $+commands[abs] )); then
  alias pacupd='sudo pacman -Sy && sudo abs'
elif (( $+commands[aur] )); then
  alias pacupd='sudo pacman -Sy && sudo aur'
else
  alias pacupd='sudo pacman -Sy'
fi

function paclist() {
  # Source: https://bbs.archlinux.org/viewtopic.php?id=93683
  LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}

function pacdisowned() {
  emulate -L zsh

  tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap  'rm -rf "$tmp"' EXIT

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr ! -name lost+found \
    \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

function pacmanallkeys() {
  emulate -L zsh
  curl -s https://www.archlinux.org/people/{developers,trustedusers}/ | \
    awk -F\" '(/pgp.mit.edu/) { sub(/.*search=0x/,""); print $1}' | \
    xargs sudo pacman-key --recv-keys
}

function pacmansignkeys() {
  emulate -L zsh
  for key in $*; do
    sudo pacman-key --recv-keys $key
    sudo pacman-key --lsign-key $key
    printf 'trust\n3\n' | sudo gpg --homedir /etc/pacman.d/gnupg \
      --no-permission-warning --command-fd 0 --edit-key $key
  done
}

if (( $+commands[xdg-open] )); then
  function pacweb() {
    pkg="$1"
    infos="$(LANG=C pacman -Si "$pkg")"
    if [[ -z "$infos" ]]; then
      return
    fi
    repo="$(grep -m 1 '^Repo' <<< "$infos" | grep -oP '[^ ]+$')"
    arch="$(grep -m 1 '^Arch' <<< "$infos" | grep -oP '[^ ]+$')"
    xdg-open "https://www.archlinux.org/packages/$repo/$arch/$pkg/" &>/dev/null
  }
fi
alias conf='/usr/bin/git --git-dir=/home/i/.cfg/ --work-tree=/home/i'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
	  *.deb)       ar x $1      ;;
	  *.tar.xz)    tar xf $1   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#
# Sets completion options.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Add zsh-completions to $fpath.
fpath=("${0:h}/completion/src" $fpath)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

#
# Options
#

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a succesive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

#
# Styles
#

# Use caching to make completion for cammands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
if zstyle -t ':prezto:module:completion:*' case-sensitive; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  setopt CASE_GLOB
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unsetopt CASE_GLOB
fi

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
#zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Media Players
zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

# Mutt
if [[ -s "$HOME/.mutt/aliases" ]]; then
  zstyle ':completion:*:*:mutt:*' menu yes select
  zstyle ':completion:*:mutt:*' users ${${${(f)"$(<"$HOME/.mutt/aliases")"}#alias[[:space:]]}%%[[:space:]]*}
fi

# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

alias vii="tmux new-session \; \
  split-window -v -p 25 \; \
  select-pane -t 2 \; \
  send-keys a C-m \;"


function ts {
  args=$@
  tmux send-keys -t top "$args" C-m
}
alias vh="tmux split-window -h -p 75 nvim"
alias vv="tmux split-window -v -p 75 nvim"
alias t="tmux"
alias vn="ts :tabnew"
alias vd="ts cd $PWD"
alias vf="ts nvim"
CTRLP_KEYBIND=${CTRLP_KEYBIND:-'^F'}
CTRLP_FUZZER_COMMAND=${CTRLP_FUZZER_COMMAND:-'zsh-select'}
CTRLP_FINDER_COMMAND=${CTRLP_FINDER_COMMAND:-'find . -not -path '\''*/\.*'\'''}
#CTRLP_EXECUTE_LINE=${CTRLP_EXECUTE_LINE:-true}
CTRLP_SEARCH_FUZZERS=${CTRLP_SEARCH_FUZZERS:-true}

# Search for fuzzers
fuzzers=($CTRLP_FUZZER_COMMAND zsh-select fzf selecta fzy fpp peco percol pick)
for fuzzer in $fuzzers; do
    if (( $+commands[$fuzzer]  )); then
        CTRLP_FUZZER_COMMAND=$fuzzer
        break;
    fi
done

ctrlp() {
    zle reset-prompt
    # TODO FINDER_COMMAND env var is not used here
    print -z - $BUFFER $( find . -not -path '*/\.*' | $CTRLP_FUZZER_COMMAND)
    zle send-break
    # TODO EXECUTE_LINE
}

zle -N ctrlp
bindkey $CTRLP_KEYBIND ctrlp
#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
