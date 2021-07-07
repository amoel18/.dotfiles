local ui = {}
local conf = require('modules.ui.config')
ui['schickele/vim-fruchtig'] = {
		--config = [[vim.cmd('colorscheme fruchtig')]]
}
ui['tmsvg/pear-tree'] = {}
ui['zhaocai/LaTeX-Box'] = {}
ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}
ui['habamax/vim-freyeday'] = {}

ui['humanoid-colors/vim-humanoid-colorscheme'] = {
	--config = [[vim.cmd('colorscheme zephyr')]]
}

ui['b4winckler/vim-angry'] = {}

ui['bkad/CamelCaseMotion'] = {}


ui['arzg/vim-colors-xcode'] = {}


ui['t9md/vim-textmanip'] = {}


ui['kurkale6ka/vim-pairs'] = {}


ui['michaeljsmith/vim-indent-object'] = {}


ui['cidem/yui'] = {}

ui['lukas-reineke/indent-blankline.nvim'] = {}

ui['ayu-theme/ayu-vim'] = {
  --config = [[vim.cmd('colorscheme ayu')]]
}
ui['rakr/vim-one'] = {
  --config = [[vim.cmd('colorscheme one')]]
}

ui['danilo-augusto/vim-afterglow'] = {
  --config = [[vim.cmd('colorscheme afterglow')]]
}

--ui['co1ncidence/javacafe.vim'] = {
   --config = [[vim.cmd('colorscheme javacafe')]]
--}

ui['rakr/vim-two-firewatch'] = {}

-- ui['glepnir/zephyr-nvim'] = {
-- }

ui['avdgaag/vim-phoenix'] = {}

ui['justinmk/vim-sneak'] = {
  config = conf.vim_sneak
}



ui['unblevable/quick-scope'] = {
  config = conf.quick_scope
}
ui['nelstrom/vim-visual-star-search'] = {
  config = conf.vim_visual_star_search
}

ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  requires = 'kyazdani42/nvim-web-devicons'
}



ui['sickill/vim-pasta'] = {
  config = conf.vim_pasta
}


ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'},
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

--ui['lewis6991/gitsigns.nvim'] = {
 -- event = {'BufRead','BufNewFile'},
  --config = conf.gitsigns,
  --requires = {'nvim-lua/plenary.nvim',opt=true}
--}

return ui
