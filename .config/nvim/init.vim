lua << EOF
local userconf = pcall(require, "custom")

if userconf then
   require "custom"
end

local core_modules = {
   "core.options",
   "core.autocmds",
   "core.mappings",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

-- non plugin mappings
require('core.mappings').misc()

EOF


lua require('code_runner').setup({})

"" lua require('code_runner').setup({})


""term = {
""  position = "vert",
""  size = 15,
""},
""filetype = {
""  java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
""  python = "python -U",
""  typescript = "deno run",
""  rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
""},
"" project = {
""   ["~/deno/example"] = {
""       name = "ExapleDeno",
""       description = "Project with deno using other command",
""       file_name = "http/main.ts",
""       command = "deno run --allow-net"
""   },
""   ["~/cpp/example"] = {
""       name = "ExapleCpp",
""       description = "Project with make file",
""       command = "make buid & cd buid/ & ./compiled_file"
""   },
""},
""})

let g:UwuNR=1 " default
let maplocalleader = "\\"
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"


vnoremap <leader>r "hy:%s/<C-r>h//g<left><left><left>
" vnoremap <C-r> "hy:s/<C-r>h//g<left><left><left>

nnoremap <Leader>t :call terminal#run('++close')<CR>
nnoremap <Leader>T :call terminal#run()<CR>

au BufEnter * set noro
let g:csv_strict_columns = 1
let g:csv_no_conceal = 1
let g:csv_nl = 1
let b:csv_fixed_width="1,5,9,13,17,21"
let g:csv_autocmd_arrange = 1

function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csv :call CSVH(<args>)


let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend


fun! ExitBuffer()
    if len(getbufinfo({'buflisted':1})) > 1
        execute 'update | bdelete'
    else
        execute 'update | quit'
    endif
endfun
""vnoremap <leader>r "hy:%s/<C-r>h//g<left><left><left>
vnoremap <C-r> "hy:s/<C-r>h//g<left><left><left>
nnoremap , :
set spelllang=en,da

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

autocmd TabLeave * let g:lasttab = tabpagenr()

autocmd VimEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

tnoremap <Esc> <C-\><C-N>  
" makes escape quit terminal
"

if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap ~ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set hidden
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

set noswapfile
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>

nnoremap <leader>v :VimtexCompile<CR>
au CursorHold * checktime  
" colorscheme uwu
"
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap ^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

nnoremap <leader>e :ReplToggle<CR>

let g:repl_filetype_commands = {
    \ 'javascript': 'node',
    \ 'python': 'ipython',
    \ 'r': 'r',
    \ }

let g:block_paste_fill_blank = 0

