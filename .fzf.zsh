# Setup fzf
# ---------
if [[ ! "$PATH" == */home/i/.local/share/nvim/site/pack/packer/start/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/i/.local/share/nvim/site/pack/packer/start/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/i/.local/share/nvim/site/pack/packer/start/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
#source "/home/i/.local/share/nvim/site/pack/packer/start/fzf/shell/key-bindings.zsh"
