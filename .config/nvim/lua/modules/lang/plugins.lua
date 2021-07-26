local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  config = conf.nvim_treesitter,
}

lang['lervag/vimtex'] = {
config = conf.vimtex
}

lang['mfussenegger/nvim-dap'] = {
	config = conf.nvim_dap
}

lang['jbyuki/one-small-step-for-vimkind'] = {}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

lang['sumneko/lua-language-server'] = {}

lang['jebaum/vim-tmuxify'] = {}


return lang
