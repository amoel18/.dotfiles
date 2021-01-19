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
    ag -U -g ".pdf$"  \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
          --bind=tab:down,btab:up \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|"); 
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null zathura  &> /dev/null 2> /dev/null
} 
[[ -e "/usr/share/fzf/fzf-extras.zsh" ]] \
  && source /usr/share/fzf/fzf-extras.zsh




[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
