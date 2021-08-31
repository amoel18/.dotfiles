lua require('init')
map <leader>e :%s/to-replace/target-string/gc<CR>
"let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let g:vimtex_toc_config = {"name": "TOC", "resize": "1", "layers": "content,todo,include", "split_width": "50", "todo_sorted": "0", "show_help":"1", "show_numbers": "1", "mode": "2"}

autocmd BufWritePre * %s/\s\+$//e

set incsearch
let ayucolor="light"
let g:one_allow_italics = 1 " I love italic for comments
set hlsearch
set termguicolors
set magic
set mousefocus
set paste
set undodir=~/.vim/undodir
set undofile
set nocursorline
set textwidth=0
set shortmess+=c
set colorcolumn=0
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

let g:rainbow_active = 1
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let g:rainbow_conf = {'guifgs': 'royalblue3, darkorange3, seagreen3, firebrick',  'ctermfgs': 'lightblue, lightyellow, lightcyan, lightmagenta'}
let g:rainbow_active = 1
let g:quickrun_known_file_types = {
				\"cpp": ["!g++ %", "./a.out"],
				\"c": ["!gcc %", "./a.out"],
				\"php": ["!php %"],
				\"vim": ["source %"],
				\"sh": ["bash %"],
				\"lua": ["luafile %"],
				\"py": ["!python %"],
				\"go": ["!go test"],
		\}

function! RepeatChar(char, count)
	return repeat(a:char, a:count)
endfunction

nnoremap z :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap Z :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <C-g> :ProComment<CR>
nnoremap <leader>g :ProComment<CR>
xnoremap <C-g> :ProComment<CR>
xnoremap <leader>g :ProComment<CR>
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

nnoremap ase g@iw"
nnoremap asq g@iw'
nnoremap ast g@iw>

nnoremap as1 g@iw(
nnoremap as2 g@iw[
nnoremap as3 g@iw{

nnoremap <silent> <LEADER>' :let col=col('.') <BAR> s/.*\zs\<.\{-}\%#.\{-}\>/'&'/ <BAR> call setpos('.', [0, line('.'), col+1, 0])<CR>

" Substitute
nnoremap <C-s> :%s//<left>
" fooo eai u aui eai u
" fooo:eai:u:aui:eai:u
vnoremap <C-s> :s/\%V\ /:/g<cr>

cnoremap $$ <C-R>=expand('%')<cr>
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

nnoremap vv ^vg_



let g:tmuxify_custom_command = 'tmux split-window -p 20'
" set slime target (tmux instead of screen)
let g:slime_target = "tmux"
" set target pane that code is sent to (optional)
let g:slime_default_config = {"socket_name": "default", "target_pane": ".1"}

let g:slime_dont_ask_default = 1
noremap <leader>r :QuickRun<CR>
" vmap <leader>l :TxSend<CR>
" noremap <leader>l :SlimeSend<CR>
" noremap <leader>l :SendLine<CR>
" set target pane that code is sent to (optional)
function! VimuxSlime()
	call VimuxRunCommand(@v, 0)
endfunction

augroup clojure
	autocmd!
	" In visual mode, send the currently visually selected text to the repl with <leader>sl
	autocmd BufEnter *.cljs,*.clj,*.cljs.hl,*.py,*.lua,*.sh vmap <Leader>l "vy :call VimuxSlime()<CR>
	" In normal mode, send the current block of code (that's surrounded by empty lines) to the repl with <leader>sl
	autocmd BufEnter *.cljs,*.clj,*.cljs.hl,*.py,*.lua,*.sh nmap <Leader>l vip<Leader>sl<CR>
augroup END

" t g:tmuxify_run = {
"   \ 'sh': 'bash %',
"   \ 'vim': 'so %',
"   \ 'go': 'go build %',
"   \ 'py': 'python %',
"   \ 'lua': 'lua %'
"   \}
function! VimuxZoomRunner()
	call VimuxInspectRunner()
	call system("tmux resize-pane -Z")
endfunction

map <Leader>z :call VimuxZoomRunner()<CR>

set undodir=~/.vim/undodir
set undofile

augroup redraw_on_refocus
	au FocusGained * :redraw!
augroup END

set wildignore=*.pyc,**/__pycache__/*,**/node_modules/*,.coverage.*,.eggs,*.egg-info/

" Ignore casing when performing completion
set wildignorecase

" Better color support
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢
unmap ase
unmap ast
unmap as1
unmap as2
unmap as3
unmap asq
 "inoremap ( ()<Esc>i
 "inoremap { {}<Esc>i
 "inoremap {<CR> {<CR>}<Esc>O
 "inoremap [ []<Esc>i
 "inoremap < <><Esc>i
 "inoremap ' ''<Esc>i
 "inoremap " ""<Esc>i

set completeopt=menuone,noselect

highlight link CompeDocumentation NormalFloat

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif
"Expand
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"
"Expand or jump
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"
"Jump forward or backward
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
