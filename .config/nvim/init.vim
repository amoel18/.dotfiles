lua require('init')
" IndentLine
let g:indentLine_char = '│'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'txt', 'startify', 'clap_input', 'clap_display', 'clap_spinner', 'clap_grep', 'packer']
" au VimEnter * ++once lua statusline = require('_statusline')
" au VimEnter * ++once lua vim.o.statusline = '%!v:lua.statusline.status()'

"   let g:bufferline_echo = 0
"   autocmd VimEnter *
"     \ let &statusline='%{bufferline#refresh_status()}'
"       \ .bufferline#get_status_string()
"
au VimEnter * set laststatus=0
au VimEnter * set concealcursor=
au VimEnter * set cmdheight=2
autocmd VimEnter * :highlight BufferCurrentMod guifg=#efefef gui=NONE
autocmd VimEnter * :highlight TabLineSel guifg=#efefef gui=NONE
autocmd VimEnter * :highlight BufferVisibleMod guifg=#efefef gui=NONE
autocmd VimEnter * :highlight BufferInactiveMod guifg=#efefef gui=NONE
autocmd VimEnter * :highlight TabLineFill guibg=#000000 gui=NONE
"let fg_target = '#8F8AAC'

autocmd VimEnter * :highlight BufferVisibleSign guifg=#efefef gui=NONE
autocmd VimEnter * :highlight BufferCurrentSign guifg=#000000 gui=NONE
"let g:bufferline.icons="both"
"let g:bufferline.icon_close_tab =''
"let g:bufferline.icon_close_tab_modified='+'
set mouse=a
"map <C-H> <Plug>(wintabs_previous)
"map <C-L> <Plug>(wintabs_next)
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

function! RepeatChar(char, count)

  return repeat(a:char, a:count)
endfunction
nnoremap <leader>1 :BufferGoto 1<CR>
nnoremap <leader>2 :BufferGoto 2<CR>
nnoremap <leader>3 :BufferGoto 3<CR>
nnoremap <leader>4 :BufferGoto 4<CR>
nnoremap <leader>5 :BufferGoto 5<CR>
nnoremap <leader>6 :BufferGoto 6<CR>
nnoremap <leader>7 :BufferGoto 7<CR>
nnoremap <leader>8 :BufferGoto 8<CR>
nnoremap <leader>9 :BufferLast<CR>
" nnoremap <silent> x :BufferClose<CR>
" nnoremap <silent> t :tabnew<CR>
nnoremap <leader>j :AleNext<CR>
nnoremap <leader>k :AlePrevious<CR>

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.3"}
let g:cellmode_tmux_panenumber='3'
vnoremap . :normal .<cr>
inoremap jk <esc>
vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader>r <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <Leader>\ :IPythonCellRun<CR>
nnoremap <Leader>z :IPythonCellClose<CR>
let g:slime_dont_ask_default = 1
"nmap <buffer> <leader>r <Esc>:w<CR>:!clear; send-keys python %<CR>
"nnoremap <leader>z :!tmux run-shell -b -t 3 'cd mybuilddir && make arg1 arg2... 2>&1'<CR><C-L>
"command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
"nnoremap <leader>r :Silent <Esc>:w<CR>:!tmux send-keys python3 %<CR>C-m
"nmap <buffer> <leader>r <Esc>:w<CR>:!clear;tmux run-shell -t 3 "python %"<CR>
" function! InsertSingle()
"   sleep 120m|let l:a = getchar(0)
"   if l:a != 0
"     silent! exec "normal a" . nr2char(l:a)
"   else
"     silent! exec "normal a "
"   endif
" endfunction
" nnoremap <silent> q :call InsertSingle()<CR>
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap q :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap Q :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
"map <Leader>r :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
noremap <silent> <leader>a :call RunTmuxPythonAllCellsAbove()<CR>

autocmd Filetype tex nnoremap <buffer> <Leader>f :update<Bar>:call VimuxRunCommand('latexmk -pdf -pvc %', 1)<CR>
nnoremap <buffer> <Leader>v :VimtexCompile<CR>
"autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
"nmap <buffer> <leader>r <Esc>:w<CR>:!clear;tmux send-keys python3 % C-m <CR>

"nnoremap <leader>z tmux run-shell -t 3 ""
autocmd VimEnter * :let bufferline.icons='both'
autocmd VimEnter * :let bufferline.icon_close_tab=' '
autocmd VimEnter * :let bufferline.icon_close_tab_modified='+'
"autocmd VimEnter * :let bufferline.auto_hide='v:false'

"let g:bufferline.icons='both'
"let g:bufferline.icon_close_tab=' '
"let g:bufferline.icon_close_tab_modified='+'
let g:bufferline = {}
let g:modified_icon = '+'
let g:bufferline.animation = v:false
"let g:bufferline.auto_hide = v:false
let g:bufferline.clickable = v:true
let g:python3_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/opt/anaconda/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
"nnoremap <C-v> :call Synctex()<cr>
let g:sneak#label = 1
function! Synctex()
    let vimura_param = " --synctex-forward " . line('.') . ":" . col('.') . ":" . expand('%:p') . " " . substitute(expand('%:p'),"tex$","pdf", "")
    if has('nvim')
        call jobstart("vimura nvim" . vimura_param)
    else
        exe "silent !vimura vim" . vimura_param . "&"
    endif
    redraw!
endfunction
map <C-v> :call Synctex()<CR>
" case insensitive sneak
let g:sneak#use_ic_scs = 1

function! ScrollOffToggle()
  if(&scrolloff == 999)
    set scrolloff=0
  else
    set scrolloff=999
  endif
endfunc

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#AC8A8C ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

highlight QuickScopePrimary guifg='#8AABAC' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#8F8AAC' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"let g:buftabline_numbers='2'
"let g:buftabline_indicators='true'
"       nmap <leader><TAB> <Plug>BufTabLine.Go(-1)
let g:tex_flavor = 'latex'
let g:vimtex_fold_manual = 1
let g:vimtex_enabled=1
"let g:vimtex_complete_recursive_bib=1
"let g:vimtex_fold_manual=1
let g:vimtex_fold_enabled =0
"let g:vimtex_latexmk_continuous = 2
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=0
set signcolumn=yes
set concealcursor=
set autochdir
"autocmd BufEnter * silent! lcd %:p:h
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:Tex_ViewRule_pdf = 'zathura'
let g:livepreview_previewer = 'zathura'
set noswapfile
filetype plugin on
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:UltiSnipsSnippetDirectories=["mysnips"]
setlocal spell
set spelllang=en_us
inoremap <C-'> <c-g>u<Esc>[s1z=`]a<c-g>u

let g:UltiSnipsExpandTrigger       = '<c-e>'
let g:slime_target = "tmux"
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" Toggle Defx using Ctrl + Space
"map <C-space> :Defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  "nnoremap <silent><buffer><expr> <CR> defx#do_action('drop','quit')
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
