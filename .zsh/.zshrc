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
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--no-multi \
	--height='80%' \
	--layout='reverse' \
	--inline-info \
        --bind='tab:down,btab:up,ctrl-d:half-page-down,ctrl-u:half-page-up' \
	--no-bold"

#export FZF_DEFAULT_COMMAND='rg --hidden --column '
#eval `dircolors ~/color/bliss-dircolors/bliss.dircolors`

#eval `dircolors ~/color/bliss-dircolors/bliss.dircolors/bliss-test/+t-o+w-directory-1`
export _JAVA_AWT_WM_NONREPARENTING=1
export WINEPREFIX=~/Games-Wine/LoL
export WINEARCH=win32
#export PYTHONPATH="/usr/bin/python"
#export PATH="/home/i/.tmux/tmux.conf:/usr/bin/python:$PATH"
export MATLAB="/home/i/matlab"
#export PYTHON="/home/i/python"
export SHFM_OPENER="/home/i/.scripts/shfm"
#export PACKER="cd .local/share/nvim/site/pack/packer"
note() {
    echo $1 >> $HOME/README.md ; nls
}
nls() { cat ~/README.md}
nrm() {head -n -1 README.md > temp.txt ; mv -f temp.txt README.md ; nls}


#s() { yes '' | head -"${1:-5}"; }    # Use as "sl 10" or "sl"

function run() {
  cmd_output=$(eval $1)
  return_value=$?
  if [ $return_value != 0 ]; then
    echo "Command $1 failed"
    exit -1
  else
    echo "output: $cmd_output"
    echo "Command succeeded."
  fi
  return $return_value
}
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
