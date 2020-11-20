"command! -nargs=1 Web       vnew|call termopen('lynx -scrollbar '.shellescape(substitute(<q-args>,'#','%23','g')))|call <SID>init_lynx()
"command! -nargs=1 Websearch vnew|call termopen('lynx -scrollbar https://duckduckgo.com/?q='.shellescape(substitute(<q-args>,'#','%23','g')))|call <SID>init_lynx()
set nocompatible
set encoding=utf-8  " text encoding
filetype off
set termguicolors
"kautocmd VimEnter *
" \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
" \|   PlugInstall --sync | q
" \| endif
"nnoremap <Space> <Nop>:
let g:python3_host_prog = '/usr/bin/python3.8'
let mapleader=','
""" Vim-Plug
call plug#begin()
Plug 'farmergreg/vim-lastplace'
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
Plug 'ayu-theme/ayu-vim'
Plug 'gkeep/iceberg-dark'
Plug 'kkga/vim-envy'
Plug 'rakr/vim-one'
Plug 'sickill/vim-monokai'
Plug 'gregsexton/MatchTag'                              " highlight matching html tags
Plug 'ghifarit53/tokyonight-vim'

"let g:airline_theme='iceberg'
Plug 'morhetz/gruvbox'
Plug 'dikiaap/minimalist'
Plug 'vim-syntastic/syntastic'
Plug 'toniz4/vim-stt'
Plug 'itmecho/bufterm.nvim'
let g:stt_auto_insert = 1
let g:stt_auto_quit = 1
Plug 'arcticicestudio/nord-vim'
Plug 'gko/vim-coloresque'
Plug 'co1ncidence/gunmetal.vim'
Plug 'nacitar/terminalkeys.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
Plug 'DanielFGray/fzf-scripts'
Plug 'rhysd/vim-clang-format'
Plug 'craigemery/vim-autotag'
Plug 'paulmr/notmuch-vim-ruby'
Plug 'mhinz/vim-signify', { 'on': ['SignifyEnable', 'SignifyEnableAll', 'SignifyToggle'] }
Plug 'vim-test/vim-test' , { 'on': ['TestNearest', 'TestFile', 'TestSuite'] }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kamykn/spelunker.vim'
Plug 'simnalamburt/vim-mundo'  " visualizes the Vim undo tree
Plug 'cocopon/iceberg.vim'
Plug 'WolfgangMehner/c-support'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-expand-region'
Plug 'lukas-reineke/indent-blankline.nvim'
let g:indentLine_concealcursor='inc'
let g:indentLine_leadingSpaceEnabled='0'
let g:indentLine_conceallevel='0'
let g:indentLine_char = '¦'
let g:indentLine_setConceal='0'
let g:indentLine_color_gui = '#fff0f6'
"let g:indentLine_char_list = ['¦', '┆', '┊', '|', '|', '|', '|', '|', '|', '|', '|', '|',]
let g:indentLine_char_list = ['|', '|', '|', '|', '|', '|', '|', '|', '|']
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_setColors = 1
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
Plug 'vim-test/vim-test' , { 'on': ['TestNearest', 'TestFile', 'TestSuite'] }
Plug 'mtdl9/vim-log-highlighting' , { 'for': ['json', 'txt', 'log'] }
Plug 'skywind3000/asyncrun.vim', { 'on': ['AsyncRun', 'AsyncRun!', 'AsyncTask'] }
Plug 'jszakmeister/vim-togglecursor'
Plug 'airblade/vim-gitgutter'
Plug 'vheon/vim-cursormode'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'ray-x/vim-interestingwords'
let g:notmuch_folders = [
      \ [ 'new', 'tag:inbox and tag:unread' ],
      \ [ 'inbox', 'tag:inbox' ],
      \ [ 'unread', 'tag:unread' ],
    \ ]
Plug 'rakr/vim-one'
Plug 'vimwiki/vimwiki'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sinetoami/dimfocus.vim'
"let g:dimfocus#fg = ['#ffdddd', 255]
let g:dimfocus#bg = ['#21222C', '3']
let g:dimfocus#blacklist = {
\ 'buffername': ['#FZF'],
\ 'filetype': ['tagbar'],
\}
Plug 'itchyny/calendar.vim'
Plug 'majutsushi/tagbar'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jalvesaq/vimcmdline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Aesthetics - Main
Plug 'dracula/vim',
Plug 'airblade/vim-rooter'
Plug 'voronianski/oceanic-next-color-scheme'
Plug 'lambdalisue/neovim-prompt'
Plug 'rstacruz/vim-closer'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/denite.nvim'
Plug 'vim-airline/vim-airline'
Plug 'mhartington/oceanic-next'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'wellle/tmux-complete.vim'                         " complete words from a tmux panes
Plug 'christoomey/vim-tmux-navigator'                   " seamless vim and tmux navigation
Plug 'tpope/vim-eunuch'                                 " run common Unix commands inside Vim
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'puremourning/vimspector'
Plug 'junegunn/goyo.vim'
Plug 'sharkdp/bat'
Plug 'danro/rename.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'
Plug 'lervag/vimtex'
Plug 'yegappan/mru'
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
"let g:tex_flavor  = 'latex'
let g:tex_flavor = 'latex'
let g:vimtex_fold_manual = 1
"let g:vimtex_latexmk_continuous = 2
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:Tex_ViewRule_pdf = 'zathura'
let g:livepreview_previewer = 'zathura'
 function! Formatonsave()
   let l:formatdiff = 1
   pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py
 endfunction
" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
Plug 'tybenz/vimdeck'
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'tpope/vim-surround'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'roxma/nvim-yarp'
Plug 'camspiers/animate.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'camspiers/lens.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
let g:polyglot_disabled = ['tex']
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'chrisbra/Colorizer'
" Entertainment
"Plug 'ryanss/vim-hackernews'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_skip_empty_lines=1
let g:current_line_whitespace_disabled_hard=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_filetypes_blacklist = ['taskedit',  'diff', 'vim', 'tex', 'markdown', 'text', 'gitcommit', 'unite', 'qf', 'help' ]
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
"Plug 'pacha/vem-tabline'
"let g:vem_tabline_show=2
Plug 'metakirby5/codi.vim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/lib.kom' -- removed! You can remove it from your vimrc
Plug 'romgrk/barbar.nvim'
" Debugging
" Plug 'puremourning/vimspector'
" Better tabline
"Plug 'mg979/vim-xtabline'
" undo time travel
Plug 'mbbill/undotree'
" Find and replace
Plug 'ChristianChiarulli/far.vim'
" Plug 'brooth/far.vim'
" Auto change html tags
Plug 'AndrewRadev/tagalong.vim'
" live server
Plug 'turbio/bracey.vim'
" Smooth scroll
Plug 'psliwka/vim-smoothie'
" async tasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-rhubarb'
Plug 'godlygeek/tabular'
Plug 'sts10/vim-pink-moon'
Plug 'junegunn/gv.vim'
Plug 'Yggdroot/indentLine'
" Terminal
Plug 'voldikss/vim-floaterm'
" Start Screen
" Plug 'mhinz/vim-startify'
" Vista
Plug 'liuchengxu/vista.vim'
" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key'
Plug 'kevinhwang91/rnvimr'
Plug 'tpope/vim-sleuth'
Plug 'rhysd/vim-clang-format'
" Better Syntax Support
" Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'sheerun/vim-polyglot'
"    let g:polyglot_disabled = ['']
" Cool Icons
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'markuskimius/csv-vim'
" Closetags
Plug 'alvan/vim-closetag'
Plug 'wesQ3/vim-windowswap'
" Themes
Plug 'christianchiarulli/nvcode.vim'
    " Files
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
" Plug 'chengzeyi/fzf-preview.vim'

"set rtp+=~/.fzf
" Convert binary, hex, etc..
Plug 'glts/vim-radical'
Plug 'arzg/vim-colors-xcode'
" Repeat stuff
Plug 'tpope/vim-repeat'
Plug 'chrisbra/csv.vim'
Plug 'jsit/toast.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'jeffkreeftmeijer/vim-dim'
" Text Navigation
Plug 'unblevable/quick-scope'
" Useful for React Commenting
Plug 'suy/vim-context-commentstring'
" highlight all matches under cursor
" Plug 'RRethy/vim-illuminate'
call plug#end()
colorscheme ayu
filetype plugin indent on
syntax on
""" Python3 VirtualEnv
"let g:ruby_host_prog = '~/home/i/.gem/ruby/2.7.0/bin/neovim-ruby-host'
""" Coloring
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP
nnoremap x "_x

set nonumber
"set numberwidth=2
set wildoptions=pum
set autoread
set tw=800
set formatoptions=tcqrn1
set formatoptions-=cro
set pumheight=9
set lazyredraw
set noshowmode
set winbl=10
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
          \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
          \,sm:block-blinkwait175-blinkoff150-blinkon175
set so=7
set wildmenu
set shiftwidth=4    " indents of four spaces
set tabstop=4
set softtabstop=4   " remove tabs instead of space
set noswapfile  " no swap
set nobackup    " no backup
set nowritebackup
set undofile
set autoindent
set smartindent
set splitbelow splitright
au BufEnter * set fo-=c fo-=r fo-=o " disable new line comments
set hlsearch                        " search highlights
set incsearch                       " Makes search act like search in modern browsers
"set nu rnu                          " lines and line numbers
set cursorline
set nocursorcolumn
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
" remove all whitespace and newlines at end of file on save
au BufWritePre * %s/\s\+$//e
au BufWritepre * %s/\n\+\%$//e
" required by coc
set hidden
set updatetime=300
set shm=W
set shm+=S
set shm+=q
set shm+=a
set shm+=A
set shm+=s
set shm+=F
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
"Always show current position
set ruler
" Height of the command bar
set cmdheight=1
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set whichwrap+=<,>,[,]
set smartcase
set foldcolumn=0
set tw=0
set history=1000
let ayucolor="light"  " for light version of theme
set ruler
set ignorecase
set smartcase
set smarttab
set shiftround
set shiftwidth=4
set noexpandtab
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start
"set list
"set listchars=tab:>~,extends:â¯,precedes:â®
set showbreak=
set breakindent
set synmaxcol=800
set nostartofline
set clipboard+=unnamedplus
set mouse=a
set guifont=Hack\ 20
set nowrap
set timeoutlen=300
set showcmd
set showmatch
set matchtime=1
set re=2
set magic
set equalalways
autocmd BufEnter * if index(g:better_whitespace_filetypes_blacklist, &ft) < 0 | exec 'EnableStripWhitespaceOnSave' | endif
" Not sure why I had this here
" but it causes an error with vimtex
"let loaded_matchparen=1
"Opaque Background (Comment out to use terminal's profile)
nnoremap <silent> <C-f> :Files<CR>
" tmux navigator

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
" Find + replace project wide (requires fr function)
" nnoremap \| :!fr<Space>
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" Don't close window, when deleting a buffer
 " command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
"     let l:currentBufNum = bufnr("%")
"     let l:alternateBufNum = bufnr("#")
"     if buflisted(l:alternateBufNum)
"         buffer #
"     else
"         bnext
"     endif
"     if bufnr("%") == l:currentBufNum
"         new
"     endif
"     if buflisted(l:currentBufNum)
"         execute("bdelete! ".l:currentBufNum)
"     endif
" endfunction
" function! CmdLine(str)
"     call feedkeys(":" . a:str)
" endfunction

let g:AutoPairsFlyMode = 0
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
" Airline
let g:airline_powerline_fonts = 1
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
nnoremap J mzJ`z
nnoremap j gj
nnoremap k gk
" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-d> <Esc>:q<CR>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
" Disable documentation window
set completeopt-=preview
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen = 'yes'
"   inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"   inoremap <C-D> <C-\><C-O>w
" EasyAlign
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)
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
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>
map <C-t>  :tabnew<CR>
map <C-W>t :Tagbar<CR>
map <C-e>  :%s/to-replace/target-string/gc<CR>
"map <C-l>  :%s/\.\s*\w/\=toupper(submatch(0))/g<CR>
map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Return to last edit position when opening files (You want this!)
map 0 ^
map ½ g_
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-h> <C-W>h
" nnoremap <C-l> <C-W>l
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
map <C-f> :Files<CR>
" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:vimtex_view_general_viewer = 'zathura'
" disables latex-box
let g:polyglot_disabled = ['latex']
" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
let g:rainbow_conf = {
  \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\}
let g:rainbow_active = 1
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;
" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
 map f <Plug>Sneak_f
 map F <Plug>Sneak_F
 map t <Plug>Sneak_t
 map T <Plug>Sneak_T
 augroup neovim_terminal
autocmd!
" Enter Terminal-mode (insert) automatically
autocmd TermOpen * startinsert
" Disables number lines on terminal buffers
autocmd TermOpen * :set nonumber norelativenumber
autocmd VimEnter * RainbowParentheses
set ttyfast                     " Indicate fast terminal conn for faster redraw
augroup END
inoremap jk <ESC>
inoremap kj <ESC>
set norelativenumber
" coc extentions
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-texlab',
  \ 'coc-tsserver',
  \ 'coc-vimtex',
  \ 'coc-marketplace',
  \ 'coc-spell-checker',
  \ 'coc-actions',
  \ 'coc-clangd',
  \ 'coc-highlight',
  \ 'coc-powershell',
  \ 'coc-r-lsp',
  \ 'coc-template',
  \ 'coc-snippets',
  \ 'coc-tasks',
  \ 'coc-tag',
  \ 'coc-style-helper',
  \ 'coc-split-term',
  \ 'coc-git',
  \ 'coc-emoji-shortcodes',
  \ 'coc-floaterm',
  \ 'coc-emoji',
  \ 'coc-discord-neovim',
  \ 'coc-diagnostic',
  \ 'coc-actions',
  \ ]
set signcolumn=no
au BufRead,BufNewFile *.tex setfiletype disabled
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> ej <Plug>(coc-diagnostic-next-error)
nmap <silent> ek <Plug>(coc-diagnostic-prev-error)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Use ripgrep for grepping
set grepprg=rg\ --vimgrep
"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" Relative path autocompletion with fzf and fd (fantastic!)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path_relative('fd')
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}%{get(b:,'coc_diagnostic_info'}

" symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" coc prettier
autocmd BufNewFile .gitignore CocCommand template.templateTop
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

" let airline#extensions#tabline#show_splits = 1
" let airline#extensions#tabline#tabs_label = 't'
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline_extensions = ['branch', 'hunks', 'coc']
" let g:airline#extensions#tabline#buffers_label = 'b'
" let g:airline#extensions#coc#enabled = 1
" " Just show the file name
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '|'
let g:airline_right_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_skip_empty_sections = 1
let g:airline_section_c = airline#section#create(['%{coc#status()}'])
hi MyRedHighlightingGroup ctermfg=red ctermbg=black guifg=red guibg=black
"hi TabLine    gui=NONE guibg=#191a21 guifg=#6272a4    cterm=NONE term=NONE ctermfg=black ctermbg=red
"let g:airline_section_x = airline#section#create(['guibg=', 'BN: %{bufnr("%")}'])
let g:airline_detect_modified = 0 "if you're sticking the + in section_c you probably want to disable detection
function! Init()
  call airline#parts#define_raw('modified', '%{&modified ? "+" : ""}')
  call airline#parts#define_accent('modified', 'red')
  let g:airline_section_x = airline#section#create(['%f', 'modified'])
endfunction
autocmd VimEnter * call Init()
let g:airline_disable_statusline = 0
let g:airline_section_a = airline#section#create(['amoel'])
let g:airline_section_y = airline#section#create(["%{get(b:,'coc_current_function','')}"])
" let g:airline_section_a = "amoel"
let g:airline_section_b =  airline#section#create(['%{StatusDiagnostic()}'])
" let g:airline_section_z = airline#section#create(['linenr'])
" Switch to your current theme
" Always show tabs
"set showtabline=1
" We don't need to see things like -- INSERT -- anymore
" Sections
" let g:airline_section_c = "%{coc#status()}%{get(b:,'coc_current_function','')}"
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction
let g:airline_section_warning = '%{StatusDiagnostic()}'
" let g:airline_section_a = ""
"let g:webdevicons_enable_airline_tabline = 1
" remove search highlight
noremap <leader><space> <esc>:noh<cr><esc>
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap <silent> q :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> Q :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap Y y$
"set nospell
" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.tex Spell
augroup END
set spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
" Better indenting
vnoremap < <gv
vnoremap > >gv
" TAB in general mode will move to text buffer
nnoremap <silent> <Tab> :bnext<CR>
"nmap <Tab> :b#<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

nnoremap <C-X> :bdelete<CR>
" imap <C-h> <C-w>h
" imap <C-j> <C-w>j
" imap <C-k> <C-w>k
" imap <C-l> <C-w>l
  " Terminal window navigation
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <Esc> <C-\><C-n>
" SHIFT-TAB will go back
" nnoremap <silent> <S-Tab> :bprevious<CR>
" Alternate way to save
nnoremap <silent> <C-q> :q!<CR>
" Alternate way to quit
map <silent> <C-s> :w!<CR>
" Use control-c instead of escape
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction
inoremap <expr> <c-x><c-s> fzf#vim#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])
" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'Î» ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction
call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
" Leader Key Maps
" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey ','<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ','<CR>
" Create map to add keys to

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100
" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'
" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
" Change the colors if you want
"highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
"highlight guibg=#e6e6d1 WhichKeyDesc
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" Single mappings
let g:which_key_map['/'] = [ ':Commentary'                        , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                        , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                          , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                             , 'balance windows' ]
let g:which_key_map['d'] = [ ':Bdelete'                           , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer'               , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                             , 'split below']
let g:which_key_map['m'] = [ ':call WindowSwap#EasyWindowSwap()'  , 'move window' ]
let g:which_key_map['n'] = [ ':FzfPreviewMruFiles'                , 'recently used' ]
let g:which_key_map['N'] = [ ':FzfPreviewMrwFiles'                , 'recently written' ]
let g:which_key_map['p'] = [ ':Files'                             , 'search files' ]
let g:which_key_map['q'] = [ 'q'                                  , 'quit' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'                      , 'ranger' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                    , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                             , 'split right']
let g:which_key_map['W'] = [ 'w'                                  , 'write' ]
let g:which_key_map['b'] = [ ':Clap buffers'                      , 'buffers']
" Group mappings
" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'v' : [':Codi'                   , 'virtual repl on'],
      \ 'V' : [':Codi!'                  , 'virtual repl off'],
      \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
      \ }
" b is for buffer
let g:which_key_map.B = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1'],
      \ '2' : ['b2'        , 'buffer 2'],
      \ 'd' : [':Bdelete'  , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '?' : ['Buffers'   , 'fzf-buffer'],
      \ }
" f is for find and replace
" let g:which_key_map.z = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }
" k is for task
let g:which_key_map.k = {
      \ 'name' : '+task' ,
      \ 'c' : [':AsyncTask file-compile'      , 'compile file'],
      \ 'b' : [':AsyncTask project-build'     , 'build project'],
      \ 'e' : [':AsyncTaskEdit'               , 'edit local tasks'],
      \ 'f' : [':AsyncTaskFzf'                , 'find task'],
      \ 'g' : [':AsyncTaskEdit!'              , 'edit global tasks'],
      \ 'h' : [':AsyncTaskList!'              , 'list hidden tasks'],
      \ 'l' : [':CocList tasks'               , 'list tasks'],
      \ 'm' : [':AsyncTaskMacro'              , 'macro help'],
      \ 'o' : [':copen'                       , 'open task view'],
      \ 'r' : [':AsyncTask file-run'          , 'run file'],
      \ 'p' : [':AsyncTask project-run'       , 'run project'],
      \ 'x' : [':cclose'                      , 'close task view'],
      \ }
      " \ 'l' : [':AsyncTaskList'               , 'list tasks'],
" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Ag'                    , 'text Ag'],
      \ 'b' : [':BLines'                , 'current buffer'],
      \ 'B' : [':Buffers'               , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Files'                 , 'files'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 'P' : [':Tags'                  , 'project tags'],
      \ 's' : [':CocList snippets'      , 'snippets'],
      \ 'S' : [':Colors'                , 'color schemes'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }
      " \ 's' : [':Snippets'     , 'snippets'],
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':Startify'        , 'Start Page']     ,
      \ 'S' : [':SSave'           , 'Save Session']   ,
      \ }
" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':!git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'a' : [':Gist -a'                          , 'post gist anon'],
      \ 'b' : [':Gist -b'                          , 'post gist browser'],
      \ 'd' : [':Gist -d'                          , 'delete gist'],
      \ 'e' : [':Gist -e'                          , 'edit gist'],
      \ 'l' : [':Gist -l'                          , 'list public gists'],
      \ 's' : [':Gist -ls'                         , 'list starred gists'],
      \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p' : [':Gist -P'                          , 'post public gist '],
      \ 'P' : [':Gist -p'                          , 'post private gist '],
      \ }
" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }
" T is for terminal
let g:which_key_map.T = {
      \ 'name' : '+tabline' ,
      \ 'b' : [':XTabListBuffers'         , 'list buffers'],
      \ 'd' : [':XTabCloseBuffer'         , 'close buffer'],
      \ 'D' : [':XTabDeleteTab'           , 'close tab'],
      \ 'h' : [':XTabHideBuffer'          , 'hide buffer'],
      \ 'i' : [':XTabInfo'                , 'info'],
      \ 'l' : [':XTabLock'                , 'lock tab'],
      \ 'm' : [':XTabMode'                , 'toggle mode'],
      \ 'n' : [':tabNext'                 , 'next tab'],
      \ 'N' : [':XTabMoveBufferNext'      , 'buffer->'],
      \ 't' : [':tabnew'                  , 'new tab'],
      \ 'p' : [':tabprevious'             , 'prev tab'],
      \ 'P' : [':XTabMoveBufferPrev'      , '<-buffer'],
      \ 'x' : [':XTabPinBuffer'           , 'pin buffer'],
      \ }
" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki' ,
      \ 'w' : ['<Plug>VimwikiIndex'                              , 'ncdu'],
      \ 'n' : ['<plug>(wiki-open)'                              , 'ncdu'],
      \ 'j' : ['<plug>(wiki-journal)'                              , 'ncdu'],
      \ 'R' : ['<plug>(wiki-reload)'                              , 'ncdu'],
      \ 'c' : ['<plug>(wiki-code-run)'                              , 'ncdu'],
      \ 'b' : ['<plug>(wiki-graph-find-backlinks)'                              , 'ncdu'],
      \ 'g' : ['<plug>(wiki-graph-in)'                              , 'ncdu'],
      \ 'G' : ['<plug>(wiki-graph-out)'                              , 'ncdu'],
      \ 'l' : ['<plug>(wiki-link-toggle)'                              , 'ncdu'],
      \ 'd' : ['<plug>(wiki-page-delete)'                              , 'ncdu'],
      \ 'r' : ['<plug>(wiki-page-rename)'                              , 'ncdu'],
      \ 't' : ['<plug>(wiki-page-toc)'                              , 'ncdu'],
      \ 'T' : ['<plug>(wiki-page-toc-local)'                              , 'ncdu'],
      \ 'e' : ['<plug>(wiki-export)'                              , 'ncdu'],
      \ 'u' : ['<plug>(wiki-list-uniq)'                              , 'ncdu'],
      \ 'U' : ['<plug>(wiki-list-uniq-local)'                              , 'ncdu'],
      \ }
" Global
" <Plug>VimwikiIndex
" <Plug>VimwikiTabIndex
" <Plug>VimwikiUISelect
" <Plug>VimwikiDiaryIndex
" <Plug>VimwikiMakeDiaryNote
" <Plug>VimwikiTabMakeDiaryNote
" <Plug>VimwikiMakeYesterdayDiaryNote
" <Plug>VimwikiMakeTomorrowDiaryNote
"
" " Local
" <Plug>Vimwiki2HTML
" <Plug>Vimwiki2HTMLBrowse
" <Plug>VimwikiDiaryGenerateLinks
" <Plug>VimwikiFollowLink
" <Plug>VimwikiSplitLink
" <Plug>VimwikiVSplitLink
" <Plug>VimwikiTabnewLink
" <Plug>VimwikiGoBackLink
" <Plug>VimwikiNextLink
" <Plug>VimwikiPrevLink
" <Plug>VimwikiGoto
" <Plug>VimwikiDeleteLink
" <Plug>VimwikiRenameLink
" <Plug>VimwikiAddHeaderLevel
call which_key#register(',', "g:which_key_map")
" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
nmap <leader>c :Bclose<cr>:tabclose<cr>gT
cmap w!! w !sudo tee %

vnoremap <c-p> "_dP
" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
" Remap leader key to ,

" Disable line numbers
" Don't show last command
" Yank and paste with the system clipboard
" Hides buffers instead of closing them
set hidden
" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab
" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2
" Indentation amount for < and > commands.
set shiftwidth=2
" do not wrap long lines by default
set nowrap
" Don't highlight current cursor line
" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler
" Only one line for command line
set cmdheight=1
" === Completion Settings === "
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])
" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'Î» ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction
call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
" === Coc.nvim === "
" Use tab to trigger completion and navigate.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl-space to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to comfirm completion.
inoremap <silent><expr> <C-e>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:SuperTabDefaultCompletionType = "<c-n>"
" Use <C-j> for both expand and jump (make expand higher priority.)
vmap <TAB> <Plug>(coc-snippets-select)
" Use <C-j> for both expand and jump (make expand higher priority.)
" Load custom snippets from snippets folder
" Hide conceal markers
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c', 'y', 'x'], [ 'z', 'warning', 'error']]
" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0
catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry
" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1
" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1
" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0
" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'
" === Signify === "
let g:signify_sign_delete = '-'
" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
" Enable true color support
" Vim airline theme
let g:airline_theme='icebergDark'
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.
" Set preview window to appear at bottom
set splitbelow
" Don't dispay mode in command line (airilne already shows it)
set noshowmode
" Set floating window to be slightly transparent
" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! TrailingSpaceHighlights() abort
" " Hightlight trailing whitespace
highlight Trail ctermbg=#6699CC guibg=#f0fdff
call matchadd('Trail', '\s\+$', 50)
endfunction
highlight LspCxxHlSymClassMethod guibg=#73d8ff
highlight LspCxxHlSymStructMethod guibg=#F29718
highlight Comment cterm=italic
highlight htmlArg cterm=italic
autocmd VimEnter * :highlight Type guifg=#6699CC gui=NONE
autocmd VimEnter * :highlight SpellBad guifg=NONE guibg=NONE gui=underline
autocmd VimEnter * :highlight Number guifg=#d5d5ff gui=NONE
autocmd VimEnter * :highlight LineNr guifg=#44475A gui=NONE
highlight! link SignColumn LineNr
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Call method on window enter
  augroup WindowManagement
    autocmd!
    autocmd WinEnter * call Handle_Win_Enter()
  augroup END
" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction
" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
"   <Space> - PageDown
"   -       - PageUp
nnoremap <M-d> <PageDown>
nnoremap <M-u> <PageUp>
" Quick window switching
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" === coc.nvim === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>
" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>
" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
"map <leader>w <Plug>(easymotion-bd-w)
" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %
" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor

nmap <leader>z :JsDoc<CR>
" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
" ignore case when searching
set ignorecase
" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase
" Automatically re-read file if a change was detected outside of vim
set autoread
set noswapfile
set scrolloff=10
set sidescrolloff=10
"set guicursor=a:blinkon500-blinkwait500-blinkoff500
autocmd InsertEnter,InsertLeave * silent! echo"\e[6 q"
if !exists('*VCenterCursor')
  augroup VCenterCursor
  au!
  au OptionSet *,*.*
    \ if and( expand("<amatch>")=='scrolloff' ,
    \         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
    \   au! VCenterCursor WinEnter,WinNew,VimResized|
    \ endif
  augroup END
  function VCenterCursor()
    if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
      let s:default_scrolloff=&scrolloff
      let &scrolloff=winheight(win_getid())/2
      au VCenterCursor WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
    else
      au! VCenterCursor WinEnter,WinNew,VimResized
      let &scrolloff=s:default_scrolloff
    endif
  endfunction
endif
nnoremap <leader>zz :call VCenterCursor()<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" Select all text
nnoremap vA ggVG
" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :noh<cr>
" Switch between tabs
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
" Quickly replace all tabs with spaces
nnoremap <leader><Space> :%s/<Tab>/  /g<CR>
" Quickly source .vimrc
nnoremap <leader>R :source $MYVIMRC<CR>
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev email    amoel18@student.sdu.dk
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <localleader>{ viw<esc>a}<esc>bi{<esc>lel
let color_path = expand('~/.vim/color.vim')
if filereadable(color_path)
  exec 'source' color_path
else
" Default color scheme
" Tell Neosnippet about the other snippets
" Add line above and below
nnoremap <C-Up> O<Esc><Down>
nnoremap <C-Down> o<Esc><Up>
" Move lines around easily
nnoremap <M-Up> :m-2<cr>==
nnoremap <M-Down> :m+<cr>==
xnoremap <M-Up> :m-2<cr>gv=gv
set viminfo='1000
set lazyredraw
autocmd VimEnter * :highlight CursorLine guibg=#2a2e38 gui=NONE
autocmd VimEnter * :highlight Cursor guibg=#ffdddd gui=NONE
autocmd VimEnter * :highlight CursorlineNr guifg=#ffdddd gui=NONE
autocmd VimEnter * :highlight Identifier guifg=#ff79c6 gui=NONE
autocmd VimEnter * :highlight Special guifg=#bd93f9 gui=NONE
autocmd VimEnter * set laststatus=2
nnoremap <silent> <Esc> :nohlsearch<CR>
xnoremap <M-Down> :m'>+<cr>gv=gv
" Search visual selection
vnoremap // y/<C-R>"<CR>
" Neosnippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets
" Neosnippet (don't use nore map!)
"imap <C-k> <Plug>(cocsnippet_expand_or_jump)
"smap <C-k> <Plug>(cocsnippet_expand_or_jump)
"xmap <C-k> <Plug>(cocsnippet_expand_target)
" Emmet
let g:user_emmet_mode='a' " enable all function in all mode
" I guest it's better not to define leader_key because <Tab> begin works slow,
" not instant
"let g:user_emmet_leader_key = '<C-i>'
let g:user_emmet_expandabbr_key = '<Tab>'
" Restore cursor position when opening file

nnoremap <silent> <Leader>w :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . line(".") . "l\\%" . col(".") . "c\\w*\\>')"<CR>
" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'
"     " the label is made by MyTabLabel()
"     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"   endfor
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999Xclose'
"   endif
"   return s
" endfunction
" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   return bufname(buflist[winnr - 1])
" endfunction
" set tabline=%!MyTabLine()
" Use <C-l> for trigger snippet expand.
" Use <C-j> for select text for visual placeholder of snippet.
vmap <CR> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
"set autochdir
map C-q :wq
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
"let g:xtabline_settings = get(g:, 'xtabline_settings', {})
let maplocalleader = "\<Space>"
nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <localleader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <localleader>o :CtrlP<CR>
map <silent> <localleader>w :w<CR>
map <localleader>v :VimtexCompile<CR>
map <localleader>b :Clap buffers<CR>
"map <silent> <localleader>q :wn<CR>
map <silent> <localleader>q :bd!<CR>
map <localleader>1 :BufferGoto1<CR>
map <localleader>2 :BufferGoto2<CR>
map <localleader>3 :BufferGoto3<CR>
map <localleader>4 :BufferGoto4<CR>
map <localleader>5 :BufferGoto5<CR>
map <localleader>6 :BufferGoto6<CR>
map <localleader>7 :BufferGoto7<CR>
vmap <localleader>y "+y
vmap <localleader>d "+d
nmap <localleader>p "+p
nmap <localleader>P "+P
vmap <localleader>p "+p
vmap <localleader>P "+P
nmap <silent> <localleader>: <Plug>(coc-floatinput-command)`
nmap <localleader><localleader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
map         <Left>  <Nop>
imap        <Left>  <Nop>
map         <Right> <Nop>
imap        <Right> <Nop>
map         <Up>    <Nop>
imap        <Up>    <Nop>
map         <Down>  <Nop>
imap        <Down>  <Nop>
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hid
" Better display for messages
" set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
set ignorecase
set smartcase
set title
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
set mouse=a
" }}}
" PLUGINS + CUSTOM FUNCTIONS {{{
" Custom
" [ ] becomes [x], [x] becomes [ ], nothing gets [ ] at start
function! ToggleTodo()
  s/\[ \]/\[bbb\]/e
  s/\[x\]/\[ \]/e
  s/\[bbb\]/\[x\]/e
  s/^\(\s*\)\([^\[ ]\)/\1[ ] \2/e
endfunction
function! ToggleTodoToday()
  s/\([^ ][^\*]\)$/\1 bbb/e
  s/ \*$//e
  s/bbb$/*/e
endfunction
" CopyMode
function! CopyModeToggle()
  if &number
    set nonumber
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction
let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" FZF color scheme updater from https://github.com/junegunn/fzf.vim/issues/59
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['String',       'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['String',       'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code != ''
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ (empty(cols) ? '' : (' --color='.join(cols, ',')))
endfunction

augroup _fzf
  autocmd!
  autocmd VimEnter,ColorScheme * call <sid>update_fzf_colors()
augroup END


" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
" Turn off default key mappings
let g:multi_cursor_use_default_mapping=0
" Switch to multicursor mode with ,mc
let g:multi_cursor_start_key=',mc'
" Ctrl-n, Ctrl-p, Ctrl-x, and <Esc> are mapped in the special multicursor
" mode once you've added at least one virtual cursor to the buffer
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
nnoremap <M-k> :call g:CursorHistBack()<CR>`z
nnoremap <M-j> :call g:CursorHistForward()<CR>`z
"nmap <M-k> mz:m-2<cr>`z
"nmap <M-j> mz:m+<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"When you have selected the area you want to search, press Alt-/. The visual selection will be removed, and a search command will star
"now you can search the preselected area
vnoremap <M-/> <Esc>/\%V
map <localleader>p :setlocal paste!<cr>
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> <C-r> "_dP
" Ripgrep for search
if executable('rg')
  set grepprg=rg\ -i\ --vimgrep
  " Ripgrep on /
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap <M-f> :Rg<SPACE>
endif
let g:go_snippet_engine = "coc#snippet"
set autowriteall
set completeopt-=preview
set noerrorbells
autocmd BufLeave * silent! :wa
set novisualbell
"nnoremap <space> zz
nnoremap n nzzzv
nnoremap N Nzzzv
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>
map <leader>ay :colorscheme ayu<CR>
map <leader>pa :colorscheme PaperColor<CR>
map <leader>pi :colorscheme pink-moon<CR>
" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>
" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" Add shortcut for toggling the tag bar
nnoremap <F3> :TagbarToggle<cr>
au FileType vimwiki set expandtab
au FileType vimwiki set shiftwidth=2
au FileType vimwiki set softtabstop=2
au FileType vimwiki set tabstop=2
"----------------------------------------------
" Language: C++
"----------------------------------------------
au FileType cpp set expandtab
au FileType cpp set shiftwidth=4
au FileType cpp set softtabstop=4
au FileType cpp set tabstop=4
"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2
"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4
"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4
set completefunc=emoji#complete
" Auto save bookmarks
let g:bookmark_auto_save = 1
" Store the bookmarks in the projects
let g:bookmark_save_per_working_dir = 1
" Disable the default key mappings
let g:bookmark_no_default_key_mappings = 1
" Configure key mappings
" This part also fixes conflicts with NERDTree
function! BookmarkMapKeys()
    nmap Mm :BookmarkToggle<cr>
    nmap Mi :BookmarkAnnotate<cr>
    nmap Mn :BookmarkNext<cr>
    nmap Mp :BookmarkPrev<cr>
    nmap Ma :BookmarkShowAll<cr>
    nmap Mc :BookmarkClear<cr>
    nmap Mx :BookmarkClearAll<cr>
    nmap Mkk :BookmarkMoveUp
    nmap Mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap Mm
    unmap Mi
    unmap Mn
    unmap Mp
    unmap Ma
    unmap Mc
    unmap Mx
    unmap Mkk
    unmap Mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
"set hlsearch guifont=lightred
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=lightblue
set tw=0
"let g:xtabline_settings.show_right_corner = 0
"let g:xtabline_settings.tab_number_in_left_corner = 0
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
hi CursorLine cterm=none
hi CursorLine gui=none
" nnoremap <expr><silent> { (col('.')==1 && len(getline(line('.')-1))==0? '2{j' : '{j')
nnoremap <silent> { :call search('\(^$\n\s*\zs\S\)\<bar>\(\S\ze\n*\%$\)', 'sW')<CR>
nnoremap <silent> } :call search('\(^$\n\s*\zs\S\)\<bar>\(^\%1l\s*\zs\S\)','sWb')<CR>

set ttyfast
autocmd FileType javascript,vim,yml,markdown setlocal ts=2 sts=2 sw=2
" set comments=sl:/*,mb:\ *,elx:\ */
" Visual linewise up and down by default (and use gj gk to go quicker)
noremap j gj
noremap k gk
map <C-n> :cnext<CR>
map <C-b> :Buffers<CR>
nmap <leader>f :FloatermNew <CR>
"vim test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let g:floaterm_keymap_toggle = '<F12>'
let g:asyncrun_open = 8
"nnoremap <Space> <Nop>
command! Spell :call spelunker#check()
let g:enable_spelunker_vim_on_readonly = 0
let g:spelunker_check_type = 0
let g:spelunker_highlight_type = 2
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_account_name_checking = 1
let g:spelunker_disable_email_checking = 1
" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END
imap <C-w> <C-[>diwi
nmap <S-o> o<Esc>k
nmap <CR> o<Esc>
nnoremap J mzJ`z
" Wrap visually selected text
vnoremap ((  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ))  <ESC>`<i(<ESC>`><right>a)<ESC>
vnoremap {{  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }}  <ESC>`<i{<ESC>`><right>a}<ESC>
vnoremap ""  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ''  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ``  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [[  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]]  <ESC>`<i[<ESC>`><right>a]<ESC>
" Select the last inserted characters
nnoremap gV `[v`]
endif
nnoremap <S-j> 4jg zz
nnoremap <S-k> 4kg zz
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
let g:clap_layout = { 'relative': 'editor' }
map z 0ma}b:'a,.j<CR>070 ?  *<Esc>dwi<CR><Esc>
" C(++) debugging
" See https://neovim.io/doc/user/nvim_terminal_emulator.html
" packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163
" Default is ARM debugging
" In the future, consider using https://github.com/embear/vim-localvimrc for
" project specific settings
let g:termdebugger = "arm-none-eabi-gdb"
let g:termdebugger_program = "pio device monitor -b 38400"

for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
endfor

set background=dark

set virtualedit=block
set smartcase
colorscheme tokyonight
set mouse=a
let &t_SI .= "\e[5 q"
let &t_SR .= "\e[3 q"
let &t_EI .= "\e[1 q"
map q: :q

set inccommand=nosplit
noremap t :ToggleTerm<CR>



map C-b :ClapBuffer
" NOTE: This variable doesn't exist before barbar runs. Create it before
"       setting any option.
let bufferline = {}

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable icons
" if set to "numbers", will show buffer index in the tabline
let bufferline.icons = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 4
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
