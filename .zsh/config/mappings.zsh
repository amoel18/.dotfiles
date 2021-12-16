# Insert Mode

#bindkey -M viins '^K' up-history # ^K to previous command.
#bindkey -M viins '^J' down-history # ^J to next command.

bindkey -M viins '^U' backward-kill-line # Kill line backwards.
bindkey -M viins '^?' backward-delete-char # Delete left char with backspace key.
bindkey -M viins '^B' backward-kill-word # Delete a WORD backward.
bindkey -M viins '^S' backward-kill-word # Delete a WORD backward.
bindkey -M viins '^[[3~' delete-char # Ensure delete key always delete forward.
bindkey -M viins ' ' custom-expand-global-alias # Space key to expand global aliases.
bindkey -M viins '^Y' custom-insert-last-typed-word # Insert last typed word for quick copy-paste.
bindkey -M viins '^R' custom-fzf-launch-from-history # Select command from history into the command line.
#bindkey -M viins '^P' custom-fzf-select # Paste the selected files and directories into the command-line.
#bindkey -M viins '^F'

# Normal Mode
bindkey -M vicmd 'j' down-line # Override down-line-or-history.
bindkey -M vicmd 'k' up-line # Override up-line-or-history.
bindkey -M vicmd 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M vicmd 'L' vi-end-of-line # Go end of line.
bindkey -M vicmd 'sr' change-surround # Change surround operator.
bindkey -M vicmd 'sd' delete-surround # Delete surround operator.
bindkey -M vicmd 'sa' add-surround # Add surround operator.
bindkey -M vicmd '^Y' custom-tmux-scroll-up # Activate tmux copy-mode and scroll up depending on key stroke.
bindkey -M vicmd '^U' custom-tmux-scroll-up # Activate tmux copy-mode and scroll up depending on key stroke.

# Visual Mode
bindkey -M visual 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M visual 'L' vi-end-of-line # Go end of line.
bindkey -M visual 'S' add-surround # Add surround.
foreach char ({a,i}{\',\",\`}) { bindkey -M visual $char select-quoted } && unset char # Text objects for delimiters.
foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M visual $char select-bracketed } && unset char # Text objects for pairs of brackets.

# Operator Mode
bindkey -M viopp 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M viopp 'L' vi-end-of-line # Go end of line.
foreach char ({a,i}{\',\",\`}) { bindkey -M viopp $char select-quoted } && unset char # Text objects for delimiters.
foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M viopp $char select-bracketed } && unset char # Text objects for pairs of brackets.

# Completion Mode
bindkey -M menuselect '^?' undo # Backspace for deleting suggesting completion as a whole.
bindkey -M menuselect '+' accept-and-hold # Accept the selection but keep the completion list open.
bindkey -M menuselect '^L' forward-char # Navigate right completion.
bindkey -M menuselect '^H' backward-char # Navigate left completion.
bindkey -M menuselect '^I' down-line-or-history # <Tab> to selection completion forward.
bindkey -M menuselect '^[[Z' reverse-menu-complete # <S-Tab> to select completion backward.
bindkey -r "^D"
bindkey -r "^E"
bindkey -r "^F"
bindkey -r "Ctrl+Space"

bindkey "^D" forward-word
bindkey "^E" autosuggest-execute
bindkey "^F" vi-end-of-line



# o for open
o () {
    tmux send-keys -t1 :tabnew\ $(tmux display -p -F "#{pane_current_path}")/"$@" C-m
		tmux select-pane -t1
}

pv () {
    tmux respawn-pane -k -t1 -c "#{pane_current_path}" nvim "$1"
}
wv () {
    tmux respawn-window -k -t1 -c "#{pane_current_path}" nvim "$1"
}
tw () {
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
zle -N p
#zle -N zsh-system-clipboard-vicmd-kill-eol
#zle -N vi-backward-kill-line


#bindkey -M vicmd '^D' vi-kill-eol
#bindkey -M vicmd '^A' backward-kill-line
bindkey '^P' p
#bindkey 'D' zsh-system-clipboard-vicmd-kill-eol

zle -N fzf-file-widget
bindkey '^G' fzf-file-widget # Go forward char or complete current completion.

bindkey -rpM viins '^[^['

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end


bindkey -M vicmd "^P" history-beginning-search-backward-end
bindkey -M viins "^P" history-beginning-search-backward-end

bindkey -M vicmd "^N" history-beginning-search-forward-end
bindkey -M viins "^N" history-beginning-search-forward-end

