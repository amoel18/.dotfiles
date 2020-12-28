##
# `cd` into the last directory upon exit.
##
function r() {
	ranger $1 --choosedir=$RANGER_LAST_DIRECTORY_BUFFER \
		&& cd "$(<$RANGER_LAST_DIRECTORY_BUFFER)" 2>/dev/null
}

##
# `oathtool` 2FA utility function.
##
function auth() {
	oathtool --base32 --totp "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.auth/totp-$1.gpg)"
}

##
# Generate authentication keys for SSH.
##
function gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
function gen-ssh-keygen-rsa() {
	ssh-keygen -t rsa -o -a 100 -b 4096 -f ~/.ssh/keys/$1 -C "$2"
}
# Make a directory and cd into it
function take {
    mkdir -p $1
    cd $1
}
 
function cd {
    builtin cd "$@" && ls --almost-all --classify --color=always --group-directories-first --literal -F
    }

fp () {
    open=xdg-open   # this will open pdf file withthe default PDF viewer on KDE, xfce, LXDE and perhaps on other desktops.

    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|"); 
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}



# ee - open 'frecency' files in $VISUAL editor
ee() {
  local files

  files="$(
    fasd -fl \
      | fzf \
          --tac \
          --reverse -1 \
          --no-sort \
          --multi \
          --tiebreak=index \
          --bind=ctrl-x:toggle-sort \
          --query "$*" \
      | grep -o "/.*"
  )" || echo 'No file selected'; return

  "${VISUAL:-vim}" "$files"
}

# source relevant env files via fzf
# note that sf() can also be used without Kubectl
sf() {
    find ~/.envs -type f | fzf | while read filename; do source $filename; done
}
