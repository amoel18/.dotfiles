lua require('init')
 let g:tagbar_type_elixir = {
     \ 'ctagstype' : 'elixir',
     \ 'kinds' : [
         \ 'f:functions',
         \ 'functions:functions',
         \ 'c:callbacks',
         \ 'd:delegates',
         \ 'e:exceptions',
         \ 'i:implementations',
         \ 'a:macros',
         \ 'o:operators',
         \ 'm:modules',
         \ 'p:protocols',
         \ 'r:records',
         \ 't:tests'
     \ ]
     \ }


 autocmd FileType python map <buffer> <leader>] :call VimuxRunCommand(python "tmux display-message -p -F "#{pane_current_path}" -t0")<CR>

 autocmd FileType python map <buffer> <leader>. :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
 autocmd FileType python imap <buffer> <leader>. <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

 autocmd FileType cpp map <buffer> <leader>. :w<CR>:exec '!make' shellescape(@%, 1)<CR>
 autocmd FileType cpp imap <buffer> <leader>. <esc>:w<CR>:exec '!make' shellescape(@%, 1)<CR>
map  <leader>a :!tmux select-pane -t- \; split-window -h -p 50 \; send-keys nvim C-m && :hi
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

 "let g:slime_dont_ask_default = 1
 function! RepeatChar(char, count)
   return repeat(a:char, a:count)
 endfunction
 nnoremap z :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
 nnoremap Z :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
 map <Leader>_ :call VimuxRunCommand(" . bufname("%")")<CR>

 autocmd Filetype tex nnoremap <buffer> <Leader>f :update<Bar>:call VimuxRunCommand('latexmk -pdf -pvc %', 1)<CR>
 nnoremap <buffer> <Leader>v :VimtexCompile<CR>
 "autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
 map gS <Plug>Sneak_,
 map gs <Plug>Sneak_;

 " Change the colors
 "highlight Sneak guifg=black guibg=#AC8A8C ctermfg=black ctermbg=black
 "highlight SneakScope guifg=red guibg=red ctermfg=red ctermbg=red

 highlight QuickScopePrimary guifg='#AC8A9C' gui=underline ctermfg=114
 highlight QuickScopeSecondary guifg='#c2cedb' gui=underline ctermfg=19 cterm=underline
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T


function! VimuxSlime()
 call VimuxRunCommand(@v, 0)
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<LocalLeader>vs<CR>
let g:slime_target = "neovim"
let g:VimuxUseNearest = 0
 let g:qs_max_chars=150
 let g:UltiSnipsEditSplit="vertical"
 let g:UltiSnipsJumpForwardTrigger = '<tab>'
 let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
 let g:UltiSnipsSnippetDirectories=["mysnips"]
 setlocal spell
 set spelllang=en_us

 inoremap <C-'> <c-g>u<Esc>[s1z=`]a<c-g>u
 " open new split panes to right and below
 " turn terminal to normal mode with escape
 " tnoremap <Esc> <C-\><C-n>
   au TermOpen * tnoremap <Esc> <c-\><c-n>
   au FileType fzf tunmap <Esc>
 " start terminal in insert mode
 au BufEnter * if &buftype == 'terminal' | :startinsert | endif
 " open terminal on ctrl+n
 function! OpenTerminal()
   split term://bash
   resize 10
 endfunction
 "nnoremap <leader>t :call OpenTerminal()<CR>
 function! OnTermClose()
     " Try to move the cursor to the last line containing text
     try
         $;?.
     catch
         " The buffer is empty here. This shouldn't ever happen
         return
     endtry
     " Is the last line an error message?
     if match(getline('.'), 'make: \*\*\* \[[^\]]\+] Error ') == -1
         call feedkeys('a ')
     endif
 endfunction
 augroup MY_TERM_AUGROUP
     autocmd!
     au TermClose * silent call OnTermClose()
 augroup END
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

 ab Mail alllllllllllllklllllllllllllm@gmail.com


 " inoremap <silent><expr> <TAB>
 "       \ pumvisible() ? "\<C-n>" :
 "       \ <SID>check_back_space() ? "\<TAB>" :
 "       \ coc#refresh()
 " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 " function! s:check_back_space() abort
 "   let col = col('.') - 1
 "   return !col || getline('.')[col - 1]  =~# '\s'
 " endfunction

 " " Use <c-space> to trigger completion.
 " inoremap <silent><expr> <C-e> coc#refresh()

 " " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
 " " Coc only does snippet and additional edit on confirm.
 " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction


 let g:vimspector_enable_mappings = 'HUMAN'



 " autocmd FileType cpp nnoremap <leader>, :!g++ % -ggdb -o $(basename -s .cpp %)<CR>
 " autocmd FileType cpp nnoremap <leader>, :call VimuxRunCommand("g++ % -ggdb -o $(basename -s .cpp %)")<CR>
 autocmd FileType cpp nnoremap <leader>, :call VimuxRunCommand("make")<CR>
 autocmd FileType python nnoremap <leader>, :call VimuxRunCommand("python ...")<CR>



 function! RenameFile()
     let old_name = expand('%')
     let new_name = input('New file name: ', expand('%'), 'file')
     if new_name != '' && new_name != old_name
         exec ':saveas ' . new_name
         exec ':silent !rm ' . old_name
         redraw!
     endif
 endfunction
 map <leader>n :call RenameFile()<cr>
 command! Bclose call <SID>BufcloseCloseIt()
 function! <SID>BufcloseCloseIt()
     let l:currentBufNum = bufnr("%")
     let l:alternateBufNum = bufnr("#")
     if buflisted(l:alternateBufNum)
         buffer #
     else
         bnext
     endif
     if bufnr("%") == l:currentBufNum
         new
     endif
     if buflisted(l:currentBufNum)
         execute("bdelete! ".l:currentBufNum)
     endif
 endfunction
 function! CmdLine(str)
     call feedkeys(":" . a:str)
 endfunction
 nnoremap H :bp<CR>
 nnoremap L :bn<CR>
 "map <leader>r :pyf <path-to-this-file>/clang-format.py<cr>
 let g:far#collapse_result = 1

 let g:far#mapping = {
         \ "jump_to_source" : ["<cr>", "<2-LeftMouse>"],
         \ "close_preview" : ["c", "q"],
         \ "preview_scroll_up" : "<PageUp>",
         \ "preview_scroll_down" : "<PageDown>",
         \ }


let g:rspec_command = 'call SendtoTmux("rspec {spec}\n")'
let g:asyncrun_open = 6
nnoremap <leader>r :Farr --auto-write-bufs --hl-match --source=vimgrep<CR>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader>- :AsyncTask file-run<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>
 vnoremap <silent> <C-r> "_dP
 nnoremap gV `[v`]
 for key in ['<Up>', '<Down>', '<Left>', '<Right>']
   exec 'noremap' key '<Nop>'
   exec 'inoremap' key '<Nop>'
 endfor
"nnoremap <leader>irb :VtrOpenRunner {'orientation': 'v', 'percentage': 25, 'cmd': 'irb'}<cr>
nnoremap <leader>; :Dispatch<CR>
nnoremap <Leader>" :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
"nnoremap <Leader>irf :VtrSendFile {'orientation': 'v', 'percentage': 25, 'cmd': 'irf'}<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
"nnoremap <silent> <Leader>t :TestFile<CR>
"nnoremap <silent> <Leader>s :TestNearest<CR>
"nnoremap <silent> <Leader>l :TestLast<CR>
"nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>
nnoremap <c-p> :Files<cr>
"augroup test
" autocmd!
" autocmd BufWrite * if test#exists() |
"   \   TestFile |
"   \ endif
"augroup END
map <leader>g <Plug>SendTestToTmux
" <leader>mr :tmuxify
"map <leader>r :tmuxify<CR>
map <leader>t :TxRun<CR>
map <leader>x :TxKill<CR>
"map <leader>rT <Plug>SendFocusedTestToTmux
set nocompatible
set nobackup
let g:tmuxify_run = {
    \ 'sh': 'zsh %',
    \ 'python': 'python %',
    \ 'cpp': 'make -d %'}
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /(\s\+$|\t)/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set showmode
set pastetoggle=<leader>v
command WQ wq
command Wq wq
command W w
command Q q
" map to current file for command mode
cnoremap $$ <C-R>=expand('%')<cr>

let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
" let &makeprg = 'make -f ' . fnameescape(substitute(expand('%'), '\m_test\.cpp$', '.makefile', ''))
"

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()


au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

nnoremap <silent> <A-o> :FSHere<cr>
nnoremap <silent> <F4> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>


lua require('dap.ext.vscode').load_launchjs()
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'github-cpp': 'http://github.com/search?l=C%2B%2B&q=fork%3Afalse+language%3AC%2B%2B+{query}&type=Code',
\ },
\ 'keep'
\)
nnoremap <silent> <leader>g :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>e :call openbrowser#smart_search(expand('<cword>'), "github-cpp")<CR>









" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
" nnoremap <leader>y :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

inoremap jk <esc>
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = ' '
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction

set path-=/usr/include
set selection=old
set timeout timeoutlen=1000 ttimeoutlen=0

set inccommand=split
nnoremap z :<C-U>exec "normal" i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap Z :<C-U>exec "normal" a".RepeatChar(nr2char(getchar()), v:count1)<CR>
if has('nvim-0.5')
    packadd nvim-dap
    nnoremap <silent> <F3> :lua require'dap'.stop()<CR>
    nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>B :lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.toggle_breakpoint(nil, nil, vim.fn.input('Log point message: '), true)<CR>
    nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle({height=15})<CR>
    nnoremap <silent> <leader>dl :lua require('dap').run_last()<CR>
    nnoremap <silent> <leader>ds :lua require('dap.ui.variables').scopes()<CR>

    command -nargs=0 Into :lua require('dap').step_into()
    command -nargs=0 LspErrors :lua require('lsp-diagnostics').errors_to_quickfix()
    command -nargs=0 LspWarnings :lua require('lsp-diagnostics').warnings_to_quickfix()
    command -nargs=0 DapBreakpoints :lua require('dap').list_breakpoints()

    nnoremap <silent> <leader>q :lua require('quickfix').toggle()<CR>
endif
if has('nvim-0.5')
    lua require('jdtls').jol_path = os.getenv('HOME') .. '/apps/jol.jar'
    lua require('jdtls.ui').pick_one_async = require('fzy').pick_one
    lua require('dap.ui').pick_one = require('fzy').pick_one
    lua lsp_ext = require('lsp-ext')
    lua require('lsp-config').setup()
    augroup lsp
      au!
      au FileType java lua require('lsp-config').start_jdt()
      au FileType haskell lua require('lsp-config').start_hie()
      au FileType python lua require('lsp-config').add_client({'pyls'})
      au FileType html lua require('lsp-config').add_client({'html-languageserver', '--stdio'}, {name='html-ls'})
      au FileType go lua require('lsp-config').start_go_ls()
      au FileType sh lua require('lsp-config').add_client({'bash-language-server', 'start'}, {name = 'bash-ls'})
      au FileType rust lua require('lsp-config').add_client({'rls'}, {root={'Cargo.toml', '.git'}})
      au FileType lua lua require('lsp-config').start_lua_ls()
      au FileType json lua require('lsp-config').add_client({'json-languageserver', '--stdio'}, {name='json-ls'})
      au FileType css lua require('lsp-config').add_client({'css-languageserver', '--stdio'}, {name='css-ls'})
      au FileType cs lua require('lsp-config').start_omnisharp()
      au FileType * lua require('util').init_hl()
    augroup end

    lua require('dap-config').setup()
endif


hi! link LspReferenceText IncSearch
hi! link LspReferenceRead IncSearch
hi! link LspReferenceWrite IncSearch
hi! link LspCodeLens Underlined
