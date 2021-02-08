#!/bin/zsh
# Spawn a new instance of Alacritty using the CWD of the currently focused
# Alacritty process.
#
# This is useful in environment like i3 where terminals are opened using a
# key-combination while another terminal is already focused.
#
# If the script is run with a non-Alacritty window in focus or a non-compliant
# version of Alacritty, an instance will be spawned in the user's $HOME.
#bash cwd="$( swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused == true).pid? // empty' | xargs pstree -p | grep "\<tmux\>\|\<fish\>\|\<bash\>\|\<zsh\>\|\<sh\>" | grep -o '[0-9]*' | xargs pwdx 2> /dev/null | cut -f2- -d' ' | sort | tail -n 1 | tr -d '\n' )"

#if [ -d "$cwd" ]; then alacritty -d "$cwd" & disown else alacritty & disown fi

#cwd="$(swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused == true).pid? // empty' | xargs pstree -p | #grep "\<tmux\>\|\<fish\>\|\<bash\>\|\<zsh\>\|\<sh\>" | grep -o '[0-9]*' | xargs pwdx 2> /dev/null | cut -f2- -d' ' | sort | #tail -n 1 | tr -d '\n')"
#alacritty --working-directory="$cwd" & disown 

terminal=${1:-xterm}
pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')
pname=$(ps -p ${pid} -o comm= | sed 's/-$//')

if [[ $pname == $terminal ]]
then
  ppid=$(pgrep --newest --parent ${pid})
  readlink /proc/${ppid}/cwd || echo $HOME
else
  echo $HOME
fi
