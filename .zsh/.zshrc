foreach piece (
	load.zsh
	exports.zsh
	prompt.zsh
	settings.zsh
	functions.zsh
	aliases.zsh
	widgets.zsh
	mappings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/config/$piece
}
# Plugin manager
source $HOME/.zsh/zinit/zinit.zsh \
    || git clone --depth 1 https://github.com/zdharma/zinit.git $HOME/.zsh/zinit

# Options
setopt \
    autocd \
    autopushd \
    histignorealldups \
    histignorespace \
    sharehistory

# Disable right prompt indent
ZLE_RPROMPT_INDENT=0

# Change cursor shape based on vi mode
function zle-keymap-select zle-line-init zle-line-finish {
    if [ "$KEYMAP" = "vicmd" ]; then
        echo -ne '\033[2 q'
    else
        echo -ne '\033[5 q'
    fi
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey '\t' end-of-line
# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

p () {
  #opn=okular # this will open pdf file withthe default PDF viewer on KDE, xfce, LXDE and perhaps on other desktops.
   opn=zathura ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
          --bind=tab:down,btab:up \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|");
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
          | cut -z -f 1 -d $'\t'  | tr -d '\n'  | xargs -r --null   $opn zathura   > /dev/null 2> /dev/null
}


[[ -e "/usr/share/fzf/fzf-extras.zsh" ]] \
  && source /usr/share/fzf/fzf-extras.zsh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_DEFAULT_OPTIONS=$FZF_DEFAULT_OPTS
#
export ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD='true'
export ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--no-multi \
	--height='80%' \
	--layout='reverse' \
	--inline-info \
        --bind='tab:down,btab:up,ctrl-d:half-page-up,ctrl-u:half-page-up,esc:abort' \
	--no-bold"

#export FZF_DEFAULT_COMMAND='rg --hidden --column '
#eval `dircolors ~/color/bliss-dircolors/bliss.dircolors`

#eval `dircolors ~/color/bliss-dircolors/bliss.dircolors/bliss-test/+t-o+w-directory-1`
export _JAVA_AWT_WM_NONREPARENTING=1
export WINEPREFIX=~/Games-Wine/LoL
export WINEARCH=win32
export MYVIMRC=~/.config/nvim/init.vim
export PACKPATH=~/.local/share/nvim/site/pack/
#export PYTHONPATH="/usr/bin/python"
export PATH="/usr/bin/python$PATH"
export MATLAB="/home/i/matlab"
#export PYTHON="/home/i/python"
export SHFM_OPENER="/home/i/.scripts/shfm"
export GOPATH="$HOME/"
#export GOROOT="/home/i/go"
export GO111MODULE=auto
export PATH=$GOPATH/bin:$PATH
#export PACKER="cd .local/share/nvim/site/pack/packer"
note() {
    echo $1 >> $HOME/README.md ; nls
}
nls() { cat ~/README.md}
nrm() {head -n -1 README.md > temp.txt ; mv -f temp.txt README.md ; nls}

c() {
  cd $(fd --type directory | fzf)
}

git()
{
   local tmp=$(mktemp)
   local repo_name

   if [ "$1" = clone ] ; then
     /usr/bin/git "$@" | tee $tmp
     repo_name=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
     rm $tmp
     printf "changing to directory %s\n" "$repo_name"
     cd "$repo_name"
   else
     /usr/bin/git "$@"
   fi
}

 if [ "$TMUX" = "" ]; then tmux; fi

# source:https://stackoverflow.com/a/65375231/2571881
function vif() {
    local fname
    fname=$(rg --hidden --files| fzf) || return
    nvim "$fname"
}


#alacritty --config-file ~/.config/alacritty/anvim.yml --title nvim  -e $SHELL -lc "nvim"
# alternative using ripgrep-all (rga) combined with fzf-tmux preview
# This requires ripgrep-all (rga) installed: https://github.com/phiresky/ripgrep-all
# This implementation below makes use of "open" on macOS, which can be replaced by other commands if needed.
# allows to search in PDFs, E-Books, Office documents, zip, tar.gz, etc. (see https://github.com/phiresky/ripgrep-all)
# find-in-file - usage: fif <searchTerm> or fif "string with spaces" or fif "regex"
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh


#>>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#		eval "$__conda_setup"
#else
if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
		source /opt/anaconda/etc/profile.d/conda.sh
else
		export PATH="/opt/anaconda/bin:$PATH"
fi
#unset __conda_setup
#<<< conda initialize <<<
#source /opt/anaconda/bin/activate root
#conda activate base
#source /opt/anaconda/bin/activate root
#export PATH=/opt/anaconda/bin:$PATH

#conda activate root

export PATH=$PATH:/usr/bin/vendor_perl

export PATH=$PATH:/usr/lib/

export WAYLAND_DISPLAY=/run/user/1000/wayland-1

#bindkey '\t' forward-word


#bindkey '^R' fzf-tab-complete

source .zsh/plugins/fzf-tab/fzf-tab.zsh
