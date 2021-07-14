TMUX

From terminal use commands to open files.
pv         : open file when no pane split
o          : open file in new tab


NVIM

INSERT
<C-U>     : delete all entered
<C-W>     : delete last word
<HOME><END>                       : beginning/end of line


NORMAL
s         : s<motion>, fx. siw 
sl        : substitute line 
S         : substitute till end of line.
<leader>s : <leader>s<motion1><motion2>, motion1 replaced by motion2. Motion can also be selected in visual mode.
gw        : swap word with the next one
cin)      : change inner next )
<leader><space> : comment


SUBSTITUTE

:%s/.*/g : delete end of line after $



COMMANDS

:runtime! syntax/2html.vim        : convert txt to html
:h 2html


for increment:
:let I=223
:'a,'bs/^/\=INC(5)/

