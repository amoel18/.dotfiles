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
  use {'chaoren/vim-wordmotion', 'justinmk/vim-sneak'}
  use { 'unblevable/quick-scope'}
  use 'mhinz/vim-signify'
  use 'tomtom/tcomment_vim'

  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'ncm2/ncm2'
  use 'ncm2/ncm2-bufword'
  use 'ncm2/ncm2-tagprefix'
  use 'ncm2/ncm2-path'
  use 'ncm2/ncm2-ultisnips'
  use 'roxma/nvim-yarp'
  use 'christoomey/vim-tmux-navigator'
  use 'tmsvg/pear-tree'
  use 'co1ncidence/mountaineer'
  use 'Shougo/defx.nvim'
  use 'kristijanhusak/defx-icons'
  use 'romainl/vim-cool'
  use 'machakann/vim-highlightedyank'
  use 'ap/vim-buftabline'
  use 'zefei/vim-wintabs'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/completion-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'lervag/vimtex'
  use 'lambdalisue/suda.vim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'neovim/nvim-lspconfig'
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
  use 'justinmk/vim-dirvish'


  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'rb', 'js', 'go'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

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
