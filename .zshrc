##!/bin/bash
zmodload zsh/zprof
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

if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi




autoload -U compinit
compinit -d ~/.zcompdump
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

setopt appendhistory
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a succesive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

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
export PATH=$PATH:/home/i/.gem/ruby/2.7.0/bin:$PATH

export JDK_HOME=/usr/lib/jvm/default

# emacs mode
bindkey -v

FAST_ALIAS_TIPS_PREFIX="  $(tput bold)"

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager \
        (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

#ZSH_LPLUG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/lplug
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
    skywind3000/z.lua \
    aloxaf/fzf-tab \
    zpm-zsh/clipboard \
    kutsan/zsh-system-clipboard \
    mafredri/zsh-async \
    kevinhwang91/zsh-tmux-capture \
    junegunn/fzf-bin \


zinit load zsh-users/zsh-completions
zinit ice from'gh-r' as'program'
zinit load sei40kr/fast-alias-tips-bin
zinit load sei40kr/zsh-fast-alias-tips
zinit load MichaelAquilina/zsh-emojis
#zstyle ':autocomplete:tab:*' fzf-completion yes
#zinit light djui/alias-tips


zinit load zsh-users/zsh-history-substring-search
#zinit light zsh-users/zsh-autosuggestions

#export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
#zinit light zdharma/fast-syntax-highlighting





omz_plugins=(
    git
    thefuck
    yarn
    archlinux
    tmux
    vi-mode
    command-not-found
    history   
    docker-compose
    fzf
)
for plugin in ${omz_plugins[@]}; do
    zinit snippet OMZ::plugins/$plugin/$plugin.plugin.zsh
done

##source $ZSH_LPLUG_DIR/completion.zsh
##source $ZSH_LPLUG_DIR/misc.zsh
##source $ZSH_LPLUG_DIR/color.zsh
#source $ZSH_LPLUG_DIR/history.zsh
##source $ZSH_LPLUG_DIR/alias-function.zsh
#source $ZSH_LPLUG_DIR/theme.zsh
#source $ZSH_LPLUG_DIR/git-prompt.zsh
#source $ZSH_LPLUG_DIR/tmux.zsh
#source $ZSH_LPLUG_DIR/fzf-plugin.zsh


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
    sys*)    open_cmd='start ""' ;;
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
alias pins="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fi {1} | awk \"{print \$2}\")' | xargs -ro paru -S"

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
alias -s PDF="zathura"
alias -s epub="open"
alias -s djuv="open"
alias -s pdf="zathura"
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

alias mv="mv -f"           # -i prompts before overwrite
alias rm="rm -f"           # -i prompts before overwrite
alias x="sudo chmod +x"


# Show local ip:

setopt histignorespace
setopt autopushd
setopt extendedhistory

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-preview 'exa -1 --color=always $realpath'
#source fzf.zsh
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

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
prompt_newline='%666v'
PROMPT=" $PROMPT"

session() {
  echo "%F{blue}%f "
}

path() {
  echo '%F{white}%B%c%b%f '
}

git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

git_status() {
  BRANCH=`git_current_branch`
  if [ ! -z $BRANCH ]; then
    if [ ! -z "$(git status --short)" ]; then
      echo -n "[%F{red}%B$BRANCH%b"
    else
      echo -n "[%F{green}%B$BRANCH%b"
    fi
    echo -n '%F{white}]%f '
  fi
}
prompt() {
  echo ' '
}
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'


PS1=' $(session)$(path)$(git_status)'

zinit load sindresorhus/pure


autoload edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey -r "^S"
bindkey -r "^D"
bindkey -r "^E"
bindkey -r "^ "
bindkey "^S" backward-word
bindkey "^D" forward-word
zle -N autosuggest-execute
bindkey "^E" autosuggest-execute
bindkey '^ ' autosuggest-accept
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word

PURE_PROMPT_VICMD_SYMBOL="  "
PURE_PROMPT_SYMBOL="  "

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
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# Jump to beginning using H and the end using L in NORMAL mode
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

# Open current command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

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

# Load and initialize the completion system ignoring insecure directories.

#
# Options
#

# Setopts
setopt AUTO_CD
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt PROMPT_SUBST

alias vii="tmux new-session \; \
  split-window -v -p 25 \; \
  select-pane -t 2 \; \
  send-keys a C-m \;"

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
pv () {
    tmux respawn-pane -k -t1 -c "#{pane_current_path}" nvim "$1"
}
wv () {
    tmux respawn-window -k -t1 -c "#{pane_current_path}" nvim "$1"
}
tv () {
  args=$@
  CDD=$(tmux display -p -F "#{pane_current_path}")
  tmux send-keys -t1 :tabnew\ $CDD/"$args" C-m
  tmux select-pane -t1
  # tmux send-keys -t1 :tabnew\ $args C-m
}

function ts {
  args=$@

  tmux send-keys -t top "$args" C-m
}

alias vp="pv"
alias vw="wv"
alias vt="tv"

alias ev='$EDITOR ~/.config/nvim/init.vim'
function tss {
tmux send-keys -l 'cmd (tmux display -p -F "#{pane_current_path}" -t0)/build' \; send-keys 'C-m' 'C-l'
}
# Completion and ls colors
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Use caching to make completion for cammands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on

# Autoload
autoload -Uz compinit
if [[ -n /.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;
autoload -Uz colors && colors
zmodload -i zsh/complist

# Zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-completions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4b4b4b'
# zinit load marlonrichert/zsh-autocomplete

# zstyle ':completion:*' extra-verbose no

# zstyle ':completion:list-expand:*' extra-verbose no

# zstyle ':completion:*' verbose no

# zstyle ':autocomplete:*' min-input 3

# zstyle ':autocomplete:*' max-lines 3

# zstyle ':autocomplete:*' config off

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='#g=#d4c3c3'
#zinit load zdharma/history-search-#ulti-word
#zinit snippet OMZ::plugins/git/git#plugin.zsh
##zinit snippet OMZ::plugins/docker-#ompose/docker-compose.plugin.zsh

# Z.lua
[ -f $HOME/.zsh/z.lua/z.lua ] && eval "$(lua $HOME/.zsh/z.lua/z.lua --init zsh enhanced once fzf)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!{.git,node_modules,flow-typed}"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

# Rbenv
if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH=$HOME/.rbenv/shims:$PATH
fi
rbenv() {
  eval "$(command rbenv init - --no-rehash)"
  rbenv "$@"
}

# NVM
export NVM_DIR=$HOME/.nvm
if [ -f $HOME/.nvm/alias/default ]; then
  PATH=${PATH}:${HOME}/.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin
fi
nvm() {
  [ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh
  nvm "$@"
}
zprof
