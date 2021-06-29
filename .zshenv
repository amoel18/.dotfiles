#if [[ -z $TMUX ]]; then
#  PATH="$PATH:/home"
#fi

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

#export TMUX="$HOME/.tmux"
export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export ZDOTDIR="$HOME/.zsh"
# Secret
#[ -f ~/.secrets ] && source ~/.secrets
