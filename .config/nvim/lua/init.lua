------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
  local dap = require('dap')
  dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/alacritty';
    args = {'-e'};
    externalConsole = false;
  }
--require('lang')
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '.local/share/nvim/site/packer/start/vimspector/gadgets/linux/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'launch';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('/usr/bin/dlv')  -- Adjust to where delve is installed
  },
}
local dap = require 'dap'
dap.adapters.cpp = {
    type = 'executable',
    name = "cppdbg",
    command = vim.api.nvim_get_runtime_file("gadgets/linux/download/vscode-cpptools/0.27.0/root/extension/debugAdapters/bin/nvim-dap.ad7Engine.json", false)[1], --  // ensure that vimspector is located inside the nvim runtime folder
    args = {},
    attach = {
        pidProperty = "processId",
        pidSelect = "ask"
    }
}
local dap = require('dap')
dap.configurations.cpp = {
  {
    type = "node";
    request = 'launch';
    program = "${file}";
    args = args;
    cwd = vim.fn.getcwd();
  },
}


local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
local dap = require('dap')
dap.configurations.python = {
  {
 type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python'
    end;
  },
}







-- in your init.lua (or copy the lines with command! in your init.vim)
vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "my_debug".start_c_debugger({<f-args>}, "gdb")
]]
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "my_debug".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]]

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'junegunn/fzf'
  use 'h-michael/lsp-ext.nvim'
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-jdtls'
  --use '.local/share/nvim/site/pack/packer/fzf'
  use 'junegunn/fzf.vim'
  use 'kjssad/quantum.vim'
  use 'tyru/open-browser.vim'
  use {"rhysd/git-messenger.vim", cmd = "GitMessenger"}
  use "AndrewRadev/splitjoin.vim"
  use "mhartington/formatter.nvim"
  use 'anott03/nvim-lspinstall'
  use 'mfussenegger/nvim-dap'
  use "tmux-plugins/vim-tmux-focus-events"
  use "numtostr/gruvbox-material"
  use "tpope/vim-sensible"
  use 'derekwyatt/vim-fswitch'
  use 'gogoprog/vim-makefile-manager'
  use 'junegunn/gv.vim'
--use 'Shougo/defx.nvim'
  use 'chaoren/vim-wordmotion'
  use 'wincent/terminus'
  use 'justinmk/vim-sneak'
  use 'nelstrom/vim-visual-star-search'
  use 'unblevable/quick-scope'
  use 'mhinz/vim-signify'
  use 'liuchengxu/vim-clap'
use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'ebranlard/vim-matlab-behave'
  use 'tomtom/tcomment_vim'
  use "easymotion/vim-easymotion"
  use {
                  {"neoclide/coc.nvim", branch = "release"},
                  -- This plugins only works with coc.nvim
                  {
                      "dsznajder/vscode-es7-javascript-react-snippets",
                      run = "yarn install --frozen-lockfile && yarn compile"
                  }
              }
  use 'slarwise/vim-tmux-send'
  use "sheerun/vim-polyglot"
  use "ntpeters/vim-better-whitespace"
  use {"moll/vim-bbye", cmd = "Bdelete"}
  use "michaeljsmith/vim-indent-object"
  use 'tpope/vim-endwise'
  use 'mfussenegger/nvim-dap-python'
  use 'mfussenegger/nvim-lua-debugger'
  use 'tpope/vim-fugitive'
  --use 'airblade/vim-gitgutter'
  use 'tpope/vim-rails'
  use "psliwka/vim-smoothie"
  use {"numtostr/BufOnly.nvim", cmd = "BufOnly"}
  use 'vimpostor/vim-prism'
  use 'octol/vim-cpp-enhanced-highlight'
  use 'wellle/tmux-complete.vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'Shougo/vimshell.vim'
  use 'jebaum/vim-tmuxify'
  use 'esamattis/slimux'
  use 'tpope/vim-surround'
  use 'puremourning/vimspector'
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'ncm2/ncm2'
  use 'neomutt/neomutt.vim'
  use 'dikiaap/minimalist'
  use 'jarun/nnn'
  --use 'brooth/far.vim'
  use 'sickill/vim-monokai'
  use 'daeyun/vim-matlab'
  use 'ncm2/ncm2-bufword'
  use 'ncm2/ncm2-tagprefix'
  use 'ncm2/ncm2-path'
  use 'kevinhwang91/rnvimr'
  use 'kaicataldo/material.vim'
  use 'MortenStabenau/matlab-vim'
  use 'ncm2/ncm2-ultisnips'
  use 'roxma/nvim-yarp'
  use 'tmsvg/pear-tree'
  use 'co1ncidence/mountaineer'
  --use 'Shougo/defx.nvim'
  use 'kristijanhusak/defx-icons'
  use 'cocopon/iceberg.vim'
  use 'brauner/vimtux'
  use 'benknoble/vim-simpl'
  use 'romainl/vim-cool'
  use 'machakann/vim-highlightedyank'
  use 'skywind3000/asynctasks.vim'
  --use 'ap/vim-buftabline'
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-web-devicons'
  --use 'pacha/vem-tabline'
  use 'ryanoasis/vim-devicons'
  use 'liuchengxu/vista.vim'
use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
  use 'rhysd/accelerated-jk'
  use 'itchyny/vim-cursorword'
  use 'kana/vim-niceblock'
  use 'kana/vim-smartchr'
  --use 'zefei/vim-wintabs'
  use 'nvim-treesitter/nvim-treesitter'
  use 'gkeep/iceberg-dark'
  use 'nvim-treesitter/playground'
  use 'liuchengxu/vim-which-key'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'joshdick/onedark.vim'
  use 'nvim-treesitter/completion-treesitter'
  use 'cocopon/pgmnt.vim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'lervag/vimtex'
  use 'lambdalisue/suda.vim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'farmergreg/vim-lastplace'
  use 'ChristianChiarulli/far.vim'
  use 'mileszs/ack.vim'
  --use 'dkprice/vim-easygrep'
  use 'jalvesaq/vimcmdline'
  use 'junegunn/rainbow_parentheses.vim'
  use 'vifm/vifm.vim'
  use 'junegunn/vim-peekaboo'
  use 'itchyny/calendar.vim'
  use 'felipec/notmuch-vim'
  use 'sonph/onehalf'
  --use 'sonph/onehalf', {'rtp': 'vim/'}
  use 'soywod/iris.vim'
  --use 'aperezdc/vim-template'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'co1ncidence/bliss'
  use 'jpalardy/vim-slime'
  use 'Shougo/defx.nvim'
  use 'KeitaNakamura/tex-conceal.vim'
  --use 'xuhdev/vim-latex-live-preview'
  use 'preservim/vimux'
  use 'thoughtbot/vim-rspec'
  use 'julienr/vim-cellmode'
  --use 'hanschen/vim-ipython-cell'
  use 'tpope/vim-abolish'
  use 'tpope/vim-unimpaired'
  --use 'neoclide/coc.nvim'
  use 'tpope/vim-sleuth'
  use 'sickill/vim-pasta'
  use 'drewtempelmeyer/palenight.vim'
  use 'haishanh/night-owl.vim'
  use 'gagoar/StripWhiteSpaces'
  use 'ajh17/Spacegray.vim'
  use 'vim-test/vim-test'
  --use 'jgdavey/vim-turbux'
  use 'Raimondi/delimitMate'
  use 'preservim/tagbar'
  use 'ayu-theme/ayu-vim'
  use 'vimoxide/vim-cinnabar'
  use 'dracula/vim'
  use 'aonemd/kuroi.vim'
  use 'nvim-lua/completion-nvim'
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
  use 'mfussenegger/nvim-lint'
  use 'mfussenegger/debug-adapter-protocol'
  use 'norcalli/nvim-colorizer.lua'
  use 'skywind3000/asyncrun.vim'
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}
  use 'tpope/vim-dispatch'
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = {{'tpope/vim-obsession', cmd = 'Prosession'}}
  }
  use 'yggdroot/indentLine'
  --use 'kyazdani42/nvim-tree.lua'
  use 'glepnir/lspsaga.nvim'
  use 'glepnir/zephyr-nvim'
  --use 'justinmk/vim-dirvish'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'vim-ruby/vim-ruby',
    opt = true,
    ft = 'ruby'
  }


  -- Plugins can have post-install/update hooks
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    opt = true,
    ft = 'go'
  }

cmd('hi! Visual guibg=#9EC49F guifg=#050505')
cmd('hi! SignColumn guibg=NONE')
cmd('hi! StatusLine guifg=white')
cmd('hi! Comment guifg=#545454')
cmd('hi! VertSplit guibg=NONE')
cmd('hi! BufferVisibleSign guifg=#efefef gui=NONE')
cmd('hi! BufferCurrentSign guifg=#000000 gui=NONE')
cmd('hi! Function ctermbg=none ctermfg=blue')
--cmd('ALEEnable')
cmd 'colorscheme ayu'                              -- Put your favorite colorscheme here
cmd 'set autochdir'
cmd 'set noswapfile'
--g:modified_icon = '+'
cmd('let g:VtrStripLeadingWhitespace = 0')
cmd('let g:VtrClearEmptyLines = 0')
cmd('let g:VtrAppendNewline = 1')
g.cursorword_delay = 250
g.python_host_skip_check = 1
g.python3_host_skip_check = 1
g.python3_host_prog = '/sbin/python3'
g.loaded_node_provider = 1
g.loaded_ruby_provider = 1
g.loaded_perl_provider = 1
g.netrw_altv = 1
g.netrw_dirhistmax = 0
g.signify_sign_add               = '+'
g.signify_sign_delete            = '_'
g.signify_sign_delete_first_line = '‾'
g.signify_sign_change            = '~'
g.signify_sign_show_count = 0
g.signify_sign_show_text = 1
g.sneak_label = 1
g.sneak_use_ic_scs = 1
g.sneak_s_next = 1
cmd('let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.3"}')
cmd('let g:slime_target = "tmux"')
cmd('let g:slime_dont_ask_default = 1')
cmd('let g:bufferline = {}               ')
cmd("let g:modified_icon = '+'           ")
cmd('let g:bufferline.animation = v:false')
cmd('let g:bufferline.auto_hide = v:true')
cmd('let g:bufferline.clickable = v:true ')
cmd('let g:tex_flavor = "latex"')
cmd('let g:vimtex_fold_manual = 1')
cmd('let g:vimtex_enabled=1')
cmd('let g:vimtex_fold_enabled =0')
cmd('let g:vimtex_compiler_progname = "nvr"')
cmd('let g:vimtex_view_method = "zathura"')
cmd('let g:vimtex_latexmk_progname= "/usr/bin/nvr"')
cmd('let g:vimtex_quickfix_mode=0')
cmd('let g:tex_conceal="abdmg"')
cmd('hi Conceal ctermbg=none')
cmd('let g:Tex_ViewRule_pdf = "zathura"')
cmd('let g:livepreview_previewer = "zathura"')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'hidden', true)
opt('o', 'mouse', 'a')
opt('o', 'conceallevel', 1)
opt('o', 'concealcursor', ' ')
opt('o', 'backspace', 'indent,eol,start') --  opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'splitbelow', true)              --  opt('o', 'conceallevel', 1)                --cmd 'colorscheme ayu'                              -- Put your favorite colorscheme here
opt('o', 'cmdheight', 2)
opt('o', 'splitright', true)              --  opt('o', 'backspace', 'indent,eol,start')  --local indent = 4
opt('o', 'incsearch', true)               --  opt('o', 'wildmode', 'longest,list')       --opt('o', 'clipboard', unnamedplus)
opt('o', 'hlsearch', true)                --  opt('o', 'splitbelow', true)               --opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'ignorecase', true)              --  opt('o', 'incsearch', true)                --opt('o', 'conceallevel', 1)
opt('o', 'smartcase', true)               --  opt('o', 'hlsearch', true)                 --opt('o', 'backspace', 'indent,eol,start')
opt('o', 'smarttab', true)                --  opt('o', 'ignorecase', true)               --opt('o', 'splitbelow', true)
opt('o', 'shiftround', true)              --  opt('o', 'smartcase', true)                --opt('o', 'splitright', true)
opt('o', 'infercase', true)               --                                              --opt('o', 'incsearch', true)
opt('o', 'lazyredraw', true)              --  opt('o', 'smarttab', true)                 --opt('o', 'hlsearch', true)
opt('o', 'listchars', 'tab:>·,nbsp:+,trail:·,extends:→,precedes:←')
opt('o', 'matchpairs', '(:),{:},[:],<:>')               --opt('o', 'nohlsearch', )
opt('o', 'backup', false)
opt('o', 'writebackup', false)
opt('o', 'showmode', false)
opt('o', 'swapfile', false)
opt('o', 'scrolloff', 8)
opt('o', 'shortmess', 'aoOTIcF')
opt('o', 'ttimeoutlen', 0)
opt('o', 'wildignore', 'tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store')
opt('o', 'wildmode', 'longest:full,list,full')
opt('o', 'termguicolors', true)
opt('o', 'expandtab', true)
opt('o', 'shiftwidth', 2)
opt('o', 'softtabstop', -1)
opt('o', 'autowriteall', true)
opt('o', 'copyindent', true)
opt('w', 'signcolumn', 'yes')
opt('w', 'linebreak', true)
--opt('o', 'syntax', 'on')
opt('o', 'filetype', 'on')
  if fn.has('vim_starting') == 1 then
    vim.api.nvim_command('syntax enable')
  end
tex_conceal = abdmg
UltiSnipsExpandTrigger = '<tab>';
UltiSnipsJumpForwardTrigger = '<tab>';
UltiSnipsJumpBackwardTrigger = '<s-tab>';

----------------------------------MAPPINGS-----------------------------------------------------
--
--

local function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-m>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

_G.enhance_jk_move = function(key)
  if packer_plugins['accelerated-jk'] and not packer_plugins['accelerated-jk'].loaded then
    cmd [[packadd accelerated-jk]]
  end
  local map = key == 'j' and '<Plug>(accelerated_jk_gj)' or '<Plug>(accelerated_jk_gk)'
  return t(map)
end

_G.enhance_ft_move = function(key)
  if not packer_plugins['vim-eft'].loaded then
    vim.cmd [[packadd vim-eft]]
  end
  local map = {
    f = '<Plug>(eft-f)',
    F = '<Plug>(eft-F)',
    [';'] = '<Plug>(eft-repeat)'
  }
  return t(map[key])
end

_G.enhance_nice_block = function (key)
  if not packer_plugins['vim-niceblock'].loaded then
    vim.cmd [[packadd vim-niceblock]]
  end
  local map = {
    I = '<Plug>(niceblock-I)',
    ['gI'] = '<Plug>(niceblock-gI)',
    A = '<Plug>(niceblock-A)'
  }
  return t(map[key])
end


vim.g.mapleader = ' '
map('n', '<Leader>w', ':w!<CR>', {noremap = true, silent = false})
map('n', '<Leader>t', ':TxRun<CR>', {noremap = true})
map('n', '<Leader>l', ':SendLine<CR>', {noremap = true, silent = false})
map('n', '<Leader>k', ':SendSelection<CR>', {noremap = true, silent = false})
map('n', '-', ':Defx<CR>', {noremap = true, silent = false})
map('n', '_', ':TagbarToggle<CR>', {noremap = true, silent = false})
map('n', '=', ':Vista<CR>', {noremap = true, silent = false})
map('n', '<Leader>q', ':q!<CR>', {noremap = true, silent = false})
--map('n', '<Leader>x', ':BufferClose!<CR>', {noremap = true, silent = false})
map('n', '<Leader><TAB>', ':BufferPrevious<CR>', {noremap = true, silent = false})
map('v', '<Leader><TAB>', ':BufferPrevious<CR>', {noremap = true, silent = false})
map('n', '<', ':BufferMovePrevious<CR>', {noremap = true, silent = false})
map('n', '>', ':BufferMoveNext<CR>', {noremap = true, silent = false})
map('n', '<C-t>', ':tabnew<CR>', {noremap = true, silent = true})
map('n', '<C-b>', ':Buffers<CR>', {noremap = true, silent = true})
map('n', '0', '^', {noremap = true, silent = true})
map('n', '$', 'g_', {noremap = true, silent = true})
map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})
map('n', ';', ':', {noremap = true})
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
map('n', 'vA', 'ggVG', {noremap = true})
map('n', '<Leader><CR>', ':noh<CR>', {noremap = true})
map('n', '<Leader>1', ':BufferGoto1<CR>', {noremap = true})
map('n', '<Leader>2', ':BufferGoto2<CR>', {noremap = true})
map('n', '<Leader>3', ':BufferGoto3<CR>', {noremap = true})
map('n', '<Leader>4', ':BufferGoto4<CR>', {noremap = true})
map('n', '<Leader>5', ':BufferGoto5<CR>', {noremap = true})
map('n', '<Leader>6', ':BufferGoto6<CR>', {noremap = true})
map('n', '<Leader>7', ':BufferGoto7<CR>', {noremap = true})
map('n', '<Leader>8', ':BufferGoto8<CR>', {noremap = true})
map('n', '<Leader>9', ':BufferGoto9<CR>', {noremap = true})
map('n', '<c-f>', ':FZF<cr>', {noremap = true})
map('n', '<leader>o', ':Telescope find_files<cr>', {noremap = true})
map('n', '<Leader>h', ':History<CR>', {noremap=true})
map('i', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
map('n', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
map('v', '<C-r>', '"_dP', {noremap = true})
map('n', '<S-Y>', 'y$', {noremap = true})
map('n', '<S-A>', 'd^', {noremap = true})
map('n', '<C-Y>', 'y^', {noremap = true})
map('n', '<Leader-y>', 'y^', {noremap = true})
--map('n', '<Leader>d', ':Defx<CR>', { noremap = true })
map('n', '<Leader>d', ':lua require"dap".continue()<CR>', { noremap = true})
map('n', '<Leader>s', ':lua require"dap".repl.toggle()<CR>', { noremap = true})
map('n', '<C-s>', ':SudaWrite<CR>', { noremap = true })
map('n', 'q', ':BufferClose!<CR>', {noremap = true, silent = false})
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})
map('n', '<C-q>', ':wqa!<CR>', {noremap = true})
map('n', '<C-x>', ':BufOnly<CR>', {noremap = true})
map('n', '<Leader>c', ':Copen<CR>', {noremap = true})
map('n', '<Leader>"', 'viw<esc>a"<esc>bi"<esc>lel', {noremap = true})
map('n', '<Leader>(', 'viw<esc>a)<esc>bi(<esc>lel', {noremap = true})
map('n', '<Leader>[', 'viw<esc>a]<esc>bi[<esc>lel', {noremap = true})
map('n', '<Leader>{', 'viw<esc>a}<esc>bi{<esc>lel', {noremap = true})
map('n', '<leader>f', ':Files<CR>', {noremap = true})
map('c', 'Q!', 'q!', {noremap = true})
map('c', 'Q', 'q', {noremap = true})
map('c', 'W', 'w', {noremap = true})
map('c', 'Wq', 'wq', {noremap = true})
map('c', 'wQ', 'wq', {noremap = true})
map('c', 'WQ', 'wq', {noremap = true})
map('c', 'Wa', 'wa', {noremap = true})
--map('i', '<C-d>', '[[pumvisible() ? "\<C-e>" : "\<End>"]]', {noremap = true}, {expr = true})
--map('i', '<C-e>', '[[<C-R>=expand("%:p:h") . "/" <CR>]]', {noremap = true})

map('i', '<TAB>', 'v:lua.tab_complete()', {expr = true})
map('i', '<C-p>', '<C-r>1', {noremap = true})
map('i', '<S-TAB>', 'v:lua.s_tab_complete()', {expr = true})
map('i', '<CR>', [[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]], {noremap = true}, {expr = true}, {wait = no})
map('n', '<leader>j', 'Lspsaga diagnostic_jump_next')
map('n', '<leader>k', 'Lspsaga diagnostic_jump_prev')
map('n', '<leader>m', ':Clap maps<CR>')
--map('n', 'j', 'v:lua.enhance_jk_move("j")', {expr = true}, {noremap = true})
--map('n', 'k', 'v:lua.enhance_jk_move("k")', {expr = true}, {noremap = true})
map('n', 'K', 'Lspsaga hover_doc', {noremap = true})
--map('n', '<leader>j' ':ALENext<CR>', {noremap = true})
--map('n', '<leader>k' ':ALEPrevious<CR>', {noremap = true})
map('v', '<TAB>', '>gv', {noremap = true})
map('v', '<S-TAB>', '<gv', {noremap = true})
map('v', '<leader>r', '"hy:%s/<C-r>h//gc<left><left><left>', {noremap = true})
map('v', '$(', '<esc>`>a)<esc>`<i(<esc>', {noremap = true})
map('v', '$[', '<esc>`>a]<esc>`<i[<esc>', {noremap = true})
map('v', '${', '<esc>`>a}<esc>`<i{<esc>', {noremap = true})
map('v', '$"', '<esc>`>a"<esc>`<i"<esc>', {noremap = true})
--map('v', '$\', '<esc>`>o*/<esc>`<O/*<esc>', {noremap = true})
map('v', '$<', '<esc>`>a><esc>`<i<<esc>', {noremap = true})
--map('x' 'I"', 'v:lua.enhance_nice_block('I')', {expr = true})
--map('x' 'gI"', 'v:lua.enhance_nice_block('gI')', {expr = true})
--map('x' 'A"', 'v:lua.enhance_nice_block('A')', {expr = true})
require'_fzf'
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    custom_captures = {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}

require'dap-config'
require'lsp-config'
require'lsp-ext'
require'_fzf'
end)

