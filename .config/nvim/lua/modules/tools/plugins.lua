local tools = {}
local conf = require('modules.tools.config')

tools['kristijanhusak/vim-dadbod-ui'] = {
  cmd = {'DBUIToggle','DBUIAddConnection','DBUI','DBUIFindBuffer','DBUIRenameBuffer'},
  config = conf.vim_dadbod_ui,
  requires = {'tpope/vim-dadbod'}
}


tools['christoomey/vim-tmux-navigator'] = {}
tools['sk1418/Join'] = {}

tools['lambdalisue/suda.vim'] = {}
tools['junegunn/fzf.vim'] = {}
tools['junegunn/fzf'] = {}

tools['kana/vim-arpeggio'] = {}


tools['editorconfig/editorconfig-vim'] = {
  ft = {'py','lua','go','typescript','javascript','vim','rust','zig','c','cpp' }
}

tools['farmergreg/vim-lastplace'] = {}

tools['slarwise/vim-tmux-send'] = {}

tools['chrisbra/csv.vim'] = {}

tools['lambdalisue/suda.vim'] = {
  cmd = 'SudaWrite'
}

tools['tpope/vim-surround'] = {}

tools['tpope/vim-repeat'] = {}


tools['glepnir/prodoc.nvim'] = {
  event = 'BufReadPre'
}

tools['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

tools['brooth/far.vim'] = {}

tools['jpalardy/vim-slime'] = {}

tools['preservim/vimux'] = {}

tools['MikeCoder/quickrun.vim'] = {}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown'
}
return tools
