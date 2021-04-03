local ui = {}
local conf = require('modules.ui.config')

ui['rakr/vim-one'] = {}

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['danilo-augusto/vim-afterglow'] = {
  --config = [[vim.cmd('colorscheme afterglow')]]
}

ui['co1ncidence/javacafe.vim'] = {
   --config = [[vim.cmd('colorscheme javacafe')]]
}

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
  requires = {'kyazdani42/nvim-web-devicons'}
}



ui['sickill/vim-pasta'] = {
  config = conf.vim_pasta
}

ui['glepnir/indent-guides.nvim'] = {
  event = 'BufRead'
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf._gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
