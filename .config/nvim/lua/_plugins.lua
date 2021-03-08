vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  --Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Simple plugins can be specified as strings
  --use 'fzf'
  use 'junegunn/fzf'
  --use '.local/share/nvim/site/pack/packer/fzf'
  use 'junegunn/fzf.vim'
  use 'kjssad/quantum.vim'
  use 'junegunn/gv.vim'
--use 'Shougo/defx.nvim'
  use 'chaoren/vim-wordmotion'
  use 'justinmk/vim-sneak'
  use 'unblevable/quick-scope'
  use 'mhinz/vim-signify'
  use 'ebranlard/vim-matlab-behave'
  --use 'tomtom/tcomment_vim'
  use 'slarwise/vim-tmux-send'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  --use 'airblade/vim-gitgutter'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
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
  use 'christoomey/vim-tmux-navigator'
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
  use 'Raimondi/delimitMate'
  use 'preservim/tagbar'
  use 'ayu-theme/ayu-vim'
  use 'vimoxide/vim-cinnabar'
  use 'dracula/vim'
  use 'aonemd/kuroi.vim'
  use 'nvim-lua/completion-nvim'
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
  use 'norcalli/nvim-colorizer.lua'
  use 'skywind3000/asyncrun.vim'
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = {{'tpope/vim-obsession', cmd = 'Prosession'}}
  }
  use 'yggdroot/indentLine'
  use 'kyazdani42/nvim-tree.lua'
  use 'glepnir/lspsaga.nvim'
  use 'glepnir/zephyr-nvim'
  --use 'justinmk/vim-dirvish'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
  --  'w0rp/ale',
  --  ft = {'rb', 'js', 'go'},
  --  cmd = 'ALEEnable',
  --  config = 'vim.cmd[[ALEEnable]]'
  --}

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
end)
