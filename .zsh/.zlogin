#if [ "$TMUX" = "" ]; then tmux; fi
# # Asynchronously zcompile .zcompdump file.
# {
#         typeset -g zcompdump="$ZDOTDIR/cache/.zcompdump"

#         if ([[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]) {
#         zcompile "$zcompdump"
#         }
# } &!
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty2" ]; then
  exec sway
fi
