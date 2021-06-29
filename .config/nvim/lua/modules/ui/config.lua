local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end


function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '+',
      buffer_close_icon = '',
      mappings = true,
      always_show_bufferline = false,
      diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " "
						or (e == "warning" and " " or "" )
					s = s .. n .. sym
				end
				return s
			end
      }
    }
end

function config.nvim_tree()
  vim.g.nvim_tree_side = "right"
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 0
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_width_allow_resize = 1
  vim.g.nvim_tree_width = 20
  vim.g.nvim_tree_hijack_netrw = 0
  vim.g.nvim_tree_bindings = {
    ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    ["-"] = ":lua require'nvim-tree'.on_keypress('close')<CR>",
    ["."] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    [","] = ":lua require'nvim-tree'.on_keypress('split')<CR>",
    ["h"] = ":lua require'nvim-tree'.on_keypress('dir_up')<CR>",
  }
  vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    icons = 1
  }
  vim.g.nvim_tree_icons = {
    --default =  '',
    default = ' ',
    symlink = ' ',
    git = {
     unstaged = "✚",
     staged =  "✚",
     unmerged =  "≠",
     renamed =  "≫",
     untracked = "★",
    },
  }
end

function config.gitsigns()
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
       -- Default keymap options
       noremap = true,
       buffer = true,

       ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
       ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

       ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
       ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
       ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
       ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
       ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

       -- Text objects
       ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
       ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
     },
  }
end

function config.indent_blakline()
  vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for"
  }
  -- because lazy load indent-blankline so need readd this autocmd
  vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

return config
