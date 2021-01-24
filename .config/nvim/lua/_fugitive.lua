local api = vim.api

-- Vim-fugitive and vim-rhubarb
api.nvim_set_keymap('n', 'gb', ':Gblame<CR>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'ghub', ':Gbrowse<CR>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'ga', ':Gwrite<CR>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'gw', ':Gread<CR>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'gd', ':Gdiff<CR>', { noremap = true, silent = false })





