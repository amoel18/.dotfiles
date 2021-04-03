-- Load Modules:
require('core')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
opt('o', 'splitright', true)              --  opt('o', 'backspace', 'indent,eol,start')  --local indent = 4
opt('o', 'splitbelow', true)              --  opt('o', 'conceallevel', 1)                
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'hidden', true)
opt('o', 'mouse', 'a')
opt('o', 'conceallevel', 1)
opt('o', 'concealcursor', ' ')
opt('o', 'backspace', 'indent,eol,start') --  opt('o', 'completeopt', 'menuone,noselect')

opt('o', 'incsearch', true)               --  opt('o', 'wildmode', 'longest,list')       --opt('o', 'clipboard', unnamedplus)
opt('o', 'hlsearch', true)                --  opt('o', 'splitbelow', true)               --opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'ignorecase', true)              --  opt('o', 'incsearch', true)                --opt('o', 'conceallevel', 1)
opt('o', 'smartcase', true)               --  opt('o', 'hlsearch', true)                 --opt('o', 'backspace', 'indent,eol,start')
opt('o', 'smarttab', true)                --  opt('o', 'ignorecase', true)               --opt('o', 'splitbelow', true)


vim.g.mapleader = ' '
vim.g.maplocalleader = ','
map('n', '<Leader>w', ':w!<CR>', {noremap = true, silent = false})
--map('n', '<Leader>t', ':TxRun<CR>', {noremap = true})
--map('n', '<leader>ar', '\rf', {noremap = true})

--map('n', '<localleader>l', ':SendLine<CR>', {noremap = true, silent = false})
--map('n', '<localleader>s', ':SendSelection<CR>', {noremap = true, silent = false})
--map('n', '<localleader>m', ':SendMakeCmd<CR>', {noremap = true, silent = false})
--map('n', '<localleader>g', ':SendKeys<CR>', {noremap = true, silent = false})
map('n', 'J', '3j', {noremap = true, silent = false})
map('n', 'K', '3k', {noremap = true, silent = false})


--map('n', '<Leader>k', ':SendSelection<CR>', {noremap = true, silent = false})
map('n', '-', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
map('n', '_', ':TagbarToggle<CR>', {noremap = true, silent = false})
map('n', '=', ':Vista!!<CR>', {noremap = true, silent = false})
map('n', '<Leader>q', ':q!<CR>', {noremap = true, silent = false})
--map('n', '<Leader>x', ':BufferClose!<CR>', {noremap = true, silent = false})
--<Plug>(Luadev-Run)
--map('v', '<Leader>vl', '<Plug>(Luadev-Run)')
map('n', '<Leader><TAB>', ':b#<CR>', {noremap = true, silent = true})
map('v', '<Leader><TAB>', ':b#<CR>', {noremap = true, silent = true})
map('n', '<', ':BufferMovePrevious<CR>', {noremap = true, silent = false})
map('n', '>', ':BufferMoveNext<CR>', {noremap = true, silent = false})
map('n', '<C-t>', ':tabnew<CR>', {noremap = true, silent = true})
map('n', 't', ':tabnew<CR>', {noremap = true, silent = true})
map('n', '<C-b>', ':Buffers<CR>', {noremap = true, silent = true})
map('i', '<C-space>', '<C-x><C-o>', {noremap = true, silent = true})
map('n', '0', '^', {noremap = true, silent = true})
map('n', 'z', 'x', {noremap = true, silent = true})
map('n', 'Z', 'X', {noremap = true, silent = true})
map('n', '$', 'g_', {noremap = true, silent = true})
map('n', '$', 'g_', {noremap = true, silent = true})
map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})
map('n', ';', ':', {noremap = true})
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
map('n', 'vA', 'ggVG', {noremap = true})
map('n', '<Leader><CR>', ':noh<CR>', {noremap = true})
map('n', '<Leader>1', ':BufferGoto1<CR>', {noremap = true})
map('n', '<Leader>2', ':BufferGoto2<CR>', {noremap = true})
map('n', '<Leader>3', ':BufferGoto3<CR>', {noremap = true})
map('n', '<Leader>4', ':BufferGoto4<CR>', {noremap = true})
map('n', '<Leader>5', ':BufferGoto5<CR>', {noremap = true})
map('n', '<Leader>6', ':BufferGoto6<CR>', {noremap = true})
map('n', '<Leader>7', ':BufferGoto7<CR>', {noremap = true})
map('n', '<Leader>8', ':BufferGoto8<CR>', {noremap = true})
map('n', '<Leader>9', ':BufferGoto9<CR>', {noremap = true})


map('n', 'C-1', ':BufferGoto1<CR>', {noremap = true})
map('n', 'C-2', ':BufferGoto2<CR>', {noremap = true})
map('n', 'C-3', ':BufferGoto3<CR>', {noremap = true})
map('n', 'C-4', ':BufferGoto4<CR>', {noremap = true})
map('n', 'C-5', ':BufferGoto5<CR>', {noremap = true})
map('n', 'C-6', ':BufferGoto6<CR>', {noremap = true})
map('n', 'C-7', ':BufferGoto7<CR>', {noremap = true})
map('n', 'C-8', ':BufferGoto8<CR>', {noremap = true})
map('n', 'C-9', ':BufferGoto9<CR>', {noremap = true})



--map('n', '<c-f>', ':FZF<cr>', {noremap = true})
--map('n', '<leader>o', ':Telescope find_files<cr>', {noremap = true})
--map('n', '<Leader>h', ':History<CR>', {noremap=true})
--map('n', '<Leader>h', ':Telescope oldfiles<CR>', {noremap=true})
map('n', '<Leader>h', ':History oldfiles<CR>', {noremap=true})
map('i', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
map('n', '<C-g>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {noremap=true})
map('v', '<C-r>', '"_dP', {noremap = true})
map('n', '<S-Y>', 'y$', {noremap = true})
map('n', '<S-A>', 'd^', {noremap = true})
map('n', '<C-Y>', 'y^', {noremap = true})
map('n', '<Leader-y>', 'y^', {noremap = true})
--map('n', '<Leader>d', ':Defx<CR>', { noremap = true })
map('n', '<Leader>d', ':lua require"dap".continue()<CR>', { noremap = true})
--map('n', '<Leader>s', ':lua require"dap".repl.toggle()<CR>', { noremap = true})
map('n', '<Leader>s', ':ProjectFiles<CR>', { noremap = true})
map('n', '<C-s>', ':SudaWrite<CR>', { noremap = true })
map('n', 'q', ':bd!<CR>', {noremap = true, silent = true})
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})
map('n', '<C-q>', ':wqa!<CR>', {noremap = true})
map('n', '<C-x>', ':BufOnly<CR>', {noremap = true})
map('n', '<Leader>c', ':Copen<CR>', {noremap = true})
map('n', '<Leader>"', 'viw<esc>a"<esc>bi"<esc>lel', {noremap = true})
map('n', '<Leader>(', 'viw<esc>a)<esc>bi(<esc>lel', {noremap = true})
map('n', '<Leader>[', 'viw<esc>a]<esc>bi[<esc>lel', {noremap = true})
map('n', '<Leader>{', 'viw<esc>a}<esc>bi{<esc>lel', {noremap = true})
map('n', '<leader>f', ':Files<CR>', {noremap = true})
--map('n', '<leader>f', ':Telescope find_files<CR>', {noremap = true})
map('n', '<C-f>', ':Files ~/ <CR>', {noremap = true})
map('c', 'Q!', 'q!', {noremap = true})
map('c', 'Q', 'q', {noremap = true})
map('c', 'W', 'w', {noremap = true})
map('c', 'Wq', 'wq', {noremap = true})
map('c', 'wQ', 'wq', {noremap = true})
map('c', 'WQ', 'wq', {noremap = true})
map('c', 'Wa', 'wa', {noremap = true})
--map('i', '<C-d>', '[[pumvisible() ? "\<C-e>" : "\<End>"]]', {noremap = true}, {expr = true})
--map('i', '<C-e>', '[[<C-R>=expand("%:p:h") . "/" <CR>]]', {noremap = true})

map('i', '<TAB>', 'v:lua.tab_complete()', {expr = true})

map('i', '<C-p>', '<C-r>1', {noremap = true})
map('i', '<S-TAB>', 'v:lua.s_tab_complete()', {expr = true})

map('n', '<leader>j', '<Plug>(coc-diagnostic-prev)')
map('n', '<leader>k', '<Plug>(coc-diagnostic-prev)')
--map('n', '<leader>m', ':Clap maps<CR>')
map('n', '<leader>m', ':Telescope keymaps maps<CR>')
--map('n', 'j', 'v:lua.enhance_jk_move("j")', {expr = true}, {noremap = true})
--map('n', 'k', 'v:lua.enhance_jk_move("k")', {expr = true}, {noremap = true})
--map('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true})
--map('n', '<leader>j' ':ALENext<CR>', {noremap = true})
--map('n', '<leader>k' ':ALEPrevious<CR>', {noremap = true})
map('v', '<TAB>', '>gv', {noremap = true})
map('v', '<S-TAB>', '<gv', {noremap = true})
map('v', '<leader>r', '"hy:%s/<C-r>h//gc<left><left><left>', {noremap = true})
map('n', '<leader>a', ':QuickRun<CR>')
map('n', '<leader>sp', ':VimuxPromptCommand<CR>')
map('n', '<leader>ss', ':VimuxRunLastCommand<CR>')
map('c', '<C-b>', '<Left>', {noremap = true})
map('c', '<C-n>', '<Right>', {noremap = true})
map('c', '<C-a>', '<Home>', {noremap = true})
map('c', '<C-e>', '<End>', {noremap = true})
map('c', '<C-d>', '[[<C-R>=expand("%:p:h") . "/" <CR>]]', {noremap = true})
map('v', '<leader>(', '<esc>`>a)<esc>`<i(<esc>', {noremap = true})
map('v', '<leader>[', '<esc>`>a]<esc>`<i[<esc>', {noremap = true})
map('v', '<leader>{', '<esc>`>a}<esc>`<i{<esc>', {noremap = true})
map('v', '<leader>"', '<esc>`>a"<esc>`<i"<esc>', {noremap = true})
--map('v', '$\', '<esc>`>o*/<esc>`<O/*<esc>', {noremap = true})
map('v', '<leader><', '<esc>`>a><esc>`<i<<esc>', {noremap = true})

cmd "highlight QuickScopePrimary guifg='#AC8A9C' gui=underline ctermfg=114"
cmd "highlight QuickScopeSecondary guifg='#c2cedb' gui=underline ctermfg=19 cterm=underline"
cmd 'set autochdir'
cmd 'set noshowmode'
cmd 'set showcmd'
cmd 'set scrolloff=8'
cmd 'set noswapfile'
cmd 'set nonumber'
cmd 'set nohls'
cmd 'set completeopt=menuone,noselect'
cmd 'set autowriteall'
cmd 'set copyindent'
cmd 'set completeopt=menuone,noselect'
cmd 'let g:peekaboo_compact = 1'
cmd 'let g:R_assign = 2'
cmd "let R_source = '/home/i/.config/nvim/plugin/tmux_split.vim'"
cmd 'let g:R_notmuxconf = 1'
cmd 'let g:completion_enable_auto_popup = 0'
cmd 'let g:completion_confirm_key = ""'
cmd 'let g:sneak#label = 1'
cmd 'let g:agprg="ag -i --vimgrep"'
cmd 'let g:afterglow_italic_comments=1'
cmd 'let g:slime_target="tmux"'

cmd 'let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}'
cmd 'let g:slime_cell_delimiter = "```"'
cmd 'let g:afterglow_inherit_background=1'
cmd 'let g:ag_highlight = 1'
cmd 'let g:VimuxCloseOnExit = 1'
cmd 'let g:VimuxCommandShell = 1'
cmd 'set autochdir'
cmd 'let g:rg_command ="rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow" '
cmd 'let g:sneak#use_ic_scs = 1'
cmd 'let g:sneak#s_next = 1'
cmd 'map s <Plug>Sneak_s'
cmd 'map S <Plug>Sneak_S'

-- cmd "highlight! BufferLineIndicatorSelected guibg='#0f1419' guifg='#36a3d9'"
-- cmd "highlight! BufferLineIndicatorBufferVisible guibg='#0f1419' guifg='#0f1419'"
-- cmd "highlight! BufferLineIndicatorSelected guibg='#0f1419' guifg='#36a3d9'"
-- cmd "highlight! BufferLineBufferSelected guibg='#0d1217' guifg='#ec6773'"
-- cmd 'hi! link BufferLineBufferSelected LineNr'
--cmd 'let g:nvim_tree_side = "right"'
 vim.api.nvim_command([[
augroup AutoCompileLatex 
autocmd BufEnter *.tex :set wrap linebreak nolist spell
autocmd BufWritePost *.tex :silent !bibtex %:t:r > /dev/null
autocmd BufWritePost *.tex :silent !compiler % > /dev/null
augroup END 
]])

cmd 'let g:NERDTreeHijackNetrw = 1'


--vim.cmd [[ ColorizerToggle ]]
--cmd 'command! -bang -nargs=? -complete=dir Files call fzf#vim#files(~/skole, <bang>0)'


vim.cmd [[
    command! -bang ProjectFiles call fzf#vim#files('~/skole', <bang>0) 
    command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command 
.shellescape(<q-args>), 1, <bang>0)
    ColorizerToggle
]]

