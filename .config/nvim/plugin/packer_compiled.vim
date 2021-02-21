" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/i/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/i/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/i/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/i/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/i/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  StripWhiteSpaces = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/StripWhiteSpaces"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  bliss = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/bliss"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/defx-icons"
  },
  ["defx.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/defx.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["iceberg-dark"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/iceberg-dark"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/iceberg.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["matlab-vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/matlab-vim"
  },
  mountaineer = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/mountaineer"
  },
  ncm2 = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ncm2"
  },
  ["ncm2-bufword"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ncm2-bufword"
  },
  ["ncm2-path"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ncm2-path"
  },
  ["ncm2-tagprefix"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ncm2-tagprefix"
  },
  ["ncm2-ultisnips"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ncm2-ultisnips"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-yarp"
  },
  onehalf = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/onehalf"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pear-tree"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/pear-tree"
  },
  ["pgmnt.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/pgmnt.vim"
  },
  playground = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  rnvimr = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  vim = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-cellmode"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cellmode"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-ipython-cell"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-ipython-cell"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-latex-live-preview"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-latex-live-preview"
  },
  ["vim-matlab"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-matlab"
  },
  ["vim-matlab-behave"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-matlab-behave"
  },
  ["vim-obsession"] = {
    after = { "vim-prosession" },
    commands = { "Prosession" },
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-obsession"
  },
  ["vim-pasta"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-pasta"
  },
  ["vim-prosession"] = {
    load_after = {
      ["vim-obsession"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-prosession"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rspec"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-rspec"
  },
  ["vim-ruby"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-ruby"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-simpl"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-simpl"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-slime"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-tmux-send"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmux-send"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimtex = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  vimtux = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimtux"
  },
  vimux = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimux"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Prosession lua require("packer.load")({'vim-obsession'}, { cmd = "Prosession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-ruby'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/i/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]]
vim.cmd [[source /home/i/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]]
vim.cmd [[source /home/i/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
