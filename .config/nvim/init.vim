lua require('init')
map <leader>e  :%s/to-replace/target-string/gc<CR>
"let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let g:vimtex_toc_config = {"name": "TOC", "resize": "1", "layers": "content,todo,include", "split_width": "50", "todo_sorted": "0", "show_help":"1", "show_numbers": "1", "mode": "2"}

let g:rainbow_active = 1
map <leader>e  :%s/to-replace/target-string/gc<CR>
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let g:rainbow_conf = {'guifgs': 'royalblue3, darkorange3, seagreen3, firebrick',  'ctermfgs': 'lightblue, lightyellow, lightcyan, lightmagenta'}
let g:rainbow_active = 1

function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction

nnoremap q :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap Q :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Substitute
nnoremap <C-s> :%s//<left>
" fooo eai u aui eai u
" fooo:eai:u:aui:eai:u
vnoremap <C-s> :s/\%V\ /:/g<cr>

cnoremap $$ <C-R>=expand('%')<cr>
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
  
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


nnoremap vv ^vg_

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

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

nnoremap o o<esc>
nnoremap O O<esc>

call arpeggio#map('n', '', 0, 'vr', ':VimuxOpenRunner<CR>')
call arpeggio#map('n', '', 0, 'vh', ':VimuxPromptCommand<CR>')
call arpeggio#map('n', '', 0, 'vl', ':SlimeSendCurrentLine<CR>')
call arpeggio#map('n', '', 0, 'vc', ':VimuxCloseRunner<CR>')
call arpeggio#map('n', '', 0, 've', ':e $MYVIMRC<CR>')
call arpeggio#map('n', '', 0, 'vu', ':e ~/.config/nvim/snippets/Ultisnips<CR>')

