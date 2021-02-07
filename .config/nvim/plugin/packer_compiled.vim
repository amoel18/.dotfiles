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
local package_path_str = "/home/i/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/i/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/i/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/i/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/i/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/defx-icons"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/gv.vim"
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
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-yarp"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pear-tree"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/pear-tree"
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
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
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
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-lastplace"
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
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-obsession"
  },
  ["vim-prosession"] = {
    load_after = {
      ["vim-obsession"] = true
    },
    loaded = false,
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
  ["vim-ruby"] = {
    loaded = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-ruby"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-signify"
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
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimtex = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimtex"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Prosession lua require("packer.load")({'vim-obsession'}, { cmd = "Prosession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-ruby'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
