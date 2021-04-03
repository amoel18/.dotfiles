local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

lang['lervag/vimtex'] = {}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

lang['sumneko/lua-language-server'] = {}

lang['jebaum/vim-tmuxify'] = {}


return lang
