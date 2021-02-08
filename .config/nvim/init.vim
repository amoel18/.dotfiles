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
autocmd VimEnter * :highlight BufferInactiveMod guifg=#191919 gui=NONE
autocmd VimEnter * :highlight TabLineFill guibg=#000000 gui=NONE
let fg_target = '#8F8AAC'

autocmd VimEnter * :highlight BufferVisibleSign guifg=#efefef gui=NONE
autocmd VimEnter * :highlight BufferCurrentSign guifg=#8F8AAC gui=NONE
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

autocmd VimEnter * :let bufferline.icons='both'
autocmd VimEnter * :let bufferline.icon_close_tab=' '
autocmd VimEnter * :let bufferline.icon_close_tab_modified='+'

"let g:bufferline.icons='both'
"let g:bufferline.icon_close_tab=' '
"let g:bufferline.icon_close_tab_modified='+'
let g:bufferline = {}
let g:modified_icon = '+'
let g:bufferline.animation = v:false
let g:bufferline.auto_hide = v:false
let g:bufferline.clickable = v:true
let g:python3_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/opt/anaconda/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

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
"let g:vimtex_latexmk_continuous = 2
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=2
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
