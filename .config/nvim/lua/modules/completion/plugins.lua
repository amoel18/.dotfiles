local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
}

completion['anott03/nvim-lspinstall'] = {}


--completion['neovim/nvim-lsp'] = {}

completion['glacambre/nvim-lsp'] = {}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['hrsh7th/nvim-compe'] = {
	event = 'InsertEnter',
	config = conf.nvim_compe,
}


completion['hrsh7th/vim-vsnip'] = {
  config = conf.vim_vsnip
}


completion['L3MON4D3/LuaSnip'] = {
		config = conf.LuaSnip
}

completion['rafamadriz/friendly-snippets'] = {
}

completion['liuchengxu/vim-clap'] = {}

completion['glepnir/smartinput.nvim'] = {
  ft = 'go',
  config = conf.smart_input
}

completion['mattn/vim-sonictemplate'] = {
  cmd = 'Template',
  ft = {'go','typescript','lua','javascript','vim','rust','markdown', 'python'},
  config = conf.vim_sonictemplate,
}

--	completion['mattn/emmet-vim'] = {
--		event = 'InsertEnter',
--		ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact', 'python'},
--		config = conf.emmet,
--	}

return completion

