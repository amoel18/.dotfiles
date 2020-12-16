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
au VimEnter * set concealcursor-=n
"map <C-H> <Plug>(wintabs_previous)
"map <C-L> <Plug>(wintabs_next)
let g:buftabline_numbers='2'
let g:buftabline_indicators='true'
let g:buftabline_separators='true'
        nmap <leader>1 <Plug>BufTabLine.Go(1)
        nmap <leader>2 <Plug>BufTabLine.Go(2)
        nmap <leader>3 <Plug>BufTabLine.Go(3)
        nmap <leader>4 <Plug>BufTabLine.Go(4)
        nmap <leader>5 <Plug>BufTabLine.Go(5)
        nmap <leader>6 <Plug>BufTabLine.Go(6)
        nmap <leader>7 <Plug>BufTabLine.Go(7)
        nmap <leader>8 <Plug>BufTabLine.Go(8)
        nmap <leader>9 <Plug>BufTabLine.Go(9)
        nmap <leader>0 <Plug>BufTabLine.Go(10)
        nmap <leader><TAB> <Plug>BufTabLine.Go(-1)
let g:tex_flavor = 'latex'
let g:vimtex_fold_manual = 1
"let g:vimtex_latexmk_continuous = 2
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:Tex_ViewRule_pdf = 'zathura'
let g:livepreview_previewer = 'zathura'

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


let g:UltiSnipsSnippetDirectories=["mysnips"]
setlocal spell
set spelllang=en_us
inoremap <C-'> <c-g>u<Esc>[s1z=`]a<c-g>u


let g:UltiSnipsExpandTrigger       = '<c-e>'

