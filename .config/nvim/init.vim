lua require('init')
filetype plugin indent on
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

let g:csv_strict_columns = 1
let g:csv_no_conceal = 1
let g:csv_nl = 1
let b:csv_fixed_width="1,5,9,13,17,21"
let g:csv_autocmd_arrange = 1

nmap <leader>8 :e /home/i/.config/nvim/lua/init.lua<CR>
nmap <leader>9 :e $MYVIMRC<CR>
nmap <leader>0 :source ~/.config/nvim/init.vim<CR>

noremap <leader>nn :Rename 

filetype on
filetype plugin on
filetype indent on
syntax on
" s for substitute
nmap <localleader>s <plug>(SubversiveSubstitute)
nmap <localleader>sl <plug>(SubversiveSubstituteLine)
nmap <localleader>S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

nmap <leader>se :%s/.*/g
nmap <silent>gw    "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l> *N*
vnoremap <C-X> <Esc>`.``gvP``P

nmap <leader>v :VimtexCompile<CR>

nmap <F8> :e /home/i/vimtips.txt<CR>

set termguicolors
" advanced incrementing (really useful)
" put following in _vimrc

function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

let g:I=0
function! INC(increment)
let g:I =g:I + a:increment
return g:I
endfunction


" A function to save word under cursor to a file
" function! SaveWord()
   " normal yiw
   " exe ':!echo '.@0.' >> word.txt'
" endfunction
" map ,p :call SaveWord()



let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "zsh": '#',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap cc :call ToggleComment()<cr>
vnoremap cc :call ToggleComment()<cr>


autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F2> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <leader><Space> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <leader><Space> :QuickRun<CR>
" autocmd FileType python map <buffer> <leader><Space> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" nmap <buffer> <leader>r <Esc>:w<CR>:!clear;python %<CR>
" nnorema> <buffer> <leader>r <Esc>:w<CR>:!clear;sh %<CR>

xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend

" Terms and interpreters
" set b:interpreter for filetypes to affect the term
nnoremap <Leader>t :call terminal#run('++close')<CR>
nnoremap <Leader>T :call terminal#run()<CR>

" autoload/terminal.vim
" Functions for dealing with the terminal
"

" Global function for calling terminal with the appropriate interpreter
" b:interpreter controls the program run
fun! ExitBuffer()
    if len(getbufinfo({'buflisted':1})) > 1
        execute 'update | bdelete'
    else
        execute 'update | quit'
    endif
endfun
" vmap * y:let @/ = @"<CR>
vnoremap <leader>r "hy:%s/<C-r>h//g<left><left><left>
vnoremap <C-r> "hy:s/<C-r>h//g<left><left><left>



set hls
vmap * y:let @/ = @"<CR>

nnoremap , :

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


"fix for yankring and neovim
let g:yankring_clipboard_monitor=0
set spelllang=en,da
set cmdheight=1


nmap        r   <Plug>(vsnip-cut-text)
xmap        r   <Plug>(vsnip-cut-text)


let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
nnoremap <F3> :ReplToggle<CR>
nmap rs <Plug>ReplSendLine
vmap rs <Plug>ReplSendVisual

let g:repl_filetype_commands = {
    \ 'javascript': 'node',
    \ 'python': 'python',
    \ 'r': 'r',
    \ }


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

imap <c-c><c-l> :SlimeSend<CR>
nmap <c-c><c-l> :SlimeSend<CR>


" Shortcut show shortcut menu and run chosen shortcut
nnoremap <silent> ? :Shortcuts<CR>

" Shortcut fallback to shortcut menu on partial entry
nnoremap <silent> <Leader> :Shortcuts<CR>


nnoremap <silent> <C-s> :call feedkeys(":saveas %\t", "t")<Return>


set nrformats-=octal " no octal numbering for <C-A> and <C-X>
set formatoptions+=c " automatically wrap comment lines
set formatoptions+=n " automatically indent numbered lists
set formatoptions+=o " continue comment marker in new lines
set formatoptions+=j " delete comment character when joining

autocmd TabLeave * let g:lasttab = tabpagenr()

tnoremap <Esc> <C-\><C-N>  
" makes escape quit terminal
"


if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap ^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


let g:maplocalleader = '\'

set timeoutlen=500


omap     <silent> ; :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> ; :lua require('tsht').nodes()<CR>

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

nnoremap <M-l> l :SidewaysRight<cr>
nnoremap <M-h> h :SidewaysLeft<cr>
