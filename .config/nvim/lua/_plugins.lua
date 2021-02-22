--  -- This file can be loaded by calling `lua require('plugins')` from your init.vim

--  -- Only required if you have packer in your `opt` pack

--   vim.cmd [[packadd packer.nvim]]

--   return require('packer').startup(function()
--    -- Packer can manage itself as an optional plugin
--    use {'wbthomason/packer.nvim', opt = true}

--    -- Simple plugins can be specified as strings
--    -- use 'fzf'
--    use 'junegunn/fzf.vim'
--    use 'justinmk/vim-sneak'
--    use 'chaoren/vim-wordmotion'
--    use 'mhinz/vim-signify'
--    use 'unblevable/quick-scope'
--    use {'mbbill/undotree', cmd = 'UndotreeToggle'}
--    use 'tomtom/tcomment_vim'
--    use 'tpope/vim-endwise'
--    use 'tpope/vim-fugitive'
--    use 'tpope/vim-rails'
--    use 'tpope/vim-repeat'
--    use 'tpope/vim-rhubarb'
--    use 'tpope/vim-surround'
--    use 'wellle/targets.vim'
--    use 'rstacruz/vim-closer'
--    use 'ncm2/ncm2'
--    use 'ncm2/ncm2-bufword'
--    use 'ncm2/ncm2-tagprefix'
--    use 'ncm2/ncm2-path'
--
--    use 'roxma/nvim-yarp'
--    use 'christoomey/vim-tmux-navigator'
--    use 'co1ncidence/mountaineer'
--    use 'romainl/vim-cool'
--    use 'nvim-treesitter/nvim-treesitter'
--    use 'norcalli/nvim-colorizer.lua'
--    use 'kyazdani42/nvim-tree.lua'
--    use {
--      'neovim/nvim-lspconfig', {
--        'nvim-lua/completion-nvim',
--        event = 'InsertEnter *',
--        config = function()
--          local completion = require('completion')
--          completion.addCompletionSource('vimtex', require('vimtex').complete_item)

--          vim.cmd [[ augroup lsp_aucmds ]]
--          vim.cmd [[ au BufEnter * lua require('completion').on_attach() ]]
--          vim.cmd [[ augroup END ]]

--          completion.on_attach()
--          vim.cmd [[ doautoall FileType ]]
--        end,
--        requires = {
--          'norcalli/snippets.nvim',
--          event = 'InsertEnter *',
--          config = function() require('snippets').use_suggested_mappings() end
--        }
--      }, {'nvim-treesitter/completion-treesitter', opt = true},
--      {
--        --'nvim-treesitter/nvim-treesitter',
--        requires = {
--          { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
--          { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }},
--          config = 'require("treesitter")', event =
--      'VimEnter *'}
--    }

--    -- Load on a combination of conditions: specific filetypes or commands
--    -- Also run code after load (see the "config" key)
--    --
--    -- Debugger
--    use {'mfussenegger/nvim-dap', opt = true}
--    use {
--      'puremourning/vimspector',
--      setup = function() vim.g.vimspector_enable_mappings = 'HUMAN' end,
--      opt = true
--    }
--    use {
--      'w0rp/ale',
--      ft = {'rb', 'js', 'go'},
--      cmd = 'ALEEnable',
--      config = 'vim.cmd[[ALEEnable]]'
--    }
--    -- LaTeX
--    use 'lervag/vimtex'
--    use 'SirVer/ultisnips'

--    use {'mhinz/vim-sayonara', cmd = 'Sayonara'}

--    use {'vim-ruby/vim-ruby', ft = 'rb'}

--    -- Plugins can have post-install/update hooks
--    use {'fatih/vim-go', ft = 'go', cmd = 'GoUpdateBinaries'}
--  end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Simple plugins can be specified as strings
  --use 'fzf'
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
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'ncm2/ncm2'
  use 'neomutt/neomutt.vim'
  use 'dikiaap/minimalist'
  --use 'brooth/far.vim'
  use 'sickill/vim-monokai'
  use 'daeyun/vim-matlab'
  use 'ncm2/ncm2-bufword'
  use 'ncm2/ncm2-tagprefix'
  use 'ncm2/ncm2-path'
  use 'kevinhwang91/rnvimr'
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
  --use 'ap/vim-buftabline'
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-web-devicons'
  --use 'pacha/vem-tabline'
  use 'ryanoasis/vim-devicons'

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
  use 'dkprice/vim-easygrep'
  use 'vifm/vifm.vim'
  use 'itchyny/calendar.vim'
  use 'felipec/notmuch-vim'
  use 'sonph/onehalf'
  --use 'sonph/onehalf', {'rtp': 'vim/'}
  use 'soywod/iris.vim'
  use 'aperezdc/vim-template'
  use 'co1ncidence/bliss'
  use 'jpalardy/vim-slime'
  use 'Shougo/defx.nvim'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'xuhdev/vim-latex-live-preview'
  use 'preservim/vimux'
  use 'thoughtbot/vim-rspec'
  use 'julienr/vim-cellmode'
  use 'hanschen/vim-ipython-cell'
  use 'tpope/vim-abolish'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sleuth'
  use 'sickill/vim-pasta'
  use 'drewtempelmeyer/palenight.vim'
  use 'haishanh/night-owl.vim'
  use 'gagoar/StripWhiteSpaces'
  use 'ayu-theme/ayu-vim'
  use 'dracula/vim'
  use 'neovim/nvim-lspconfig'
  use 'aonemd/kuroi.vim'
  use 'nvim-lua/completion-nvim'
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
  use 'norcalli/nvim-colorizer.lua'
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = {{'tpope/vim-obsession', cmd = 'Prosession'}}
  }
  use 'yggdroot/indentLine'
  use {
    'kyazdani42/nvim-tree.lua',
    opt = true
  }
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
