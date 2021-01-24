local api = vim.api
local M = {}

function M.setup()
  vim.g.mapleader = ' '
  api.nvim_set_keymap('n', '<Leader>w', ':w!<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>s', '<C-W>w', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>r', ':source /home/i/.config/nvim/init.vim<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<C-o>', ':tabnew<CR>', {noremap = true, silent = true})
  api.nvim_set_keymap('n', '<C-b>', ':Buffers<CR>', {noremap = true, silent = true})
  api.nvim_set_keymap('n', '0', '^', {noremap = true, silent = true})
  api.nvim_set_keymap('n', '$', 'g_', {noremap = true, silent = true})
  api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
  api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
  api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true})
  api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true})
  api.nvim_set_keymap('n', 'vA', 'ggVG', {noremap = true})
  api.nvim_set_keymap('n', '<Leader><CR>', ':noh<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>1', ':b1<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>2', ':b2<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>3', ':b3<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>4', ':b4<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>5', ':b5<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>6', ':b6<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>7', ':b7<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>8', ':b8<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>9', ':b9<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>v', ':VimtexCompile<CR>', {noremap=true})
  api.nvim_set_keymap('i', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
  api.nvim_set_keymap('n', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
  api.nvim_set_keymap('v', '<C-r>', '"_dP', {noremap = true})
  api.nvim_set_keymap('n', '<S-Y>', 'y$', {noremap = true})
  api.nvim_set_keymap('n', '<Leader-Y>', 'y$', {noremap = true})
  --api.nvim_set_keymap('n', '')


  api.nvim_set_keymap('n', '-', ':Dirvish<CR>', { noremap = true })

  api.nvim_set_keymap('n', '<C-w>', ':SudaWrite<CR>', { noremap = true })
  api.nvim_set_keymap('n', '<C-t>', ':cd /home/i/ | :tabnew /home/i/[NoName]<CR>', { noremap = true, silent = false})

     
  api.nvim_set_keymap('n', 'q', ':<C-u>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>', {noremap = true})


  api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
  api.nvim_set_keymap('v', '>', '>gv', {noremap = true})
  --api.nvim_set_keymap('n', '<TAB>', ':b#<CR>', {noremap = true})
  --api.nvim_set_keymap('n', '<TAB>', '<Plug>BufTabLine.Go(-1)<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<C-q>', ':wqa!<CR>', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>c', ':copen<CR>', {noremap = true})
  



  api.nvim_set_keymap('n', '<Leader>"', 'viw<esc>a"<esc>bi"<esc>lel', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>(', 'viw<esc>a)<esc>bi(<esc>lel', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>[', 'viw<esc>a]<esc>bi[<esc>lel', {noremap = true})
  api.nvim_set_keymap('n', '<Leader>{', 'viw<esc>a}<esc>bi{<esc>lel', {noremap = true})

  api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', {noremap = true})
  api.nvim_set_keymap('i', '<C-f>', ':Files<CR>', {noremap = true})

  api.nvim_set_keymap('n', '<Leader>dq', ':Bclose<CR>:tabclose<CR>gT', {noremap = true})
 

  api.nvim_set_keymap('n', '<Tab>', '%', {noremap = true})
  api.nvim_set_keymap('v', '<Tab>', '%', {noremap = true})
  api.nvim_set_keymap('c', 'Q!', 'q!', {noremap = true})
  api.nvim_set_keymap('c', 'Q', 'q', {noremap = true})
  api.nvim_set_keymap('c', 'W', 'w', {noremap = true})
  api.nvim_set_keymap('c', 'Wq', 'wq', {noremap = true})
  api.nvim_set_keymap('c', 'wQ', 'wq', {noremap = true})
  api.nvim_set_keymap('c', 'WQ', 'wq', {noremap = true})
  api.nvim_set_keymap('c', 'Wa', 'wa', {noremap = true})
  

end

return M
