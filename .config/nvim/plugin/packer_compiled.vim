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
  ["Spacegray.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/Spacegray.vim"
  },
  StripWhiteSpaces = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/StripWhiteSpaces"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  bliss = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/bliss"
  },
  ["calendar.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/calendar.vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["debug-adapter-protocol"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/debug-adapter-protocol"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/defx-icons"
  },
  ["defx.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/defx.nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/far.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
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
  ["iris.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/iris.vim"
  },
  ["kuroi.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/kuroi.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/material.vim"
  },
  ["matlab-vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/matlab-vim"
  },
  minimalist = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/minimalist"
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
  ["neomutt.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/neomutt.vim"
  },
  ["night-owl.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/night-owl.vim"
  },
  nnn = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nnn"
  },
  ["notmuch-vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/notmuch-vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lua-debugger"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/nvim-lua-debugger"
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
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  onehalf = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/onehalf"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/i/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["palenight.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/palenight.vim"
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quantum.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/quantum.vim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  slimux = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/slimux"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  tagbar = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  terminus = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/terminus"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/tmux-complete.vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vifm.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vifm.vim"
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
  ["vim-cinnabar"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cinnabar"
  },
  ["vim-clap"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-clap"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-fswitch"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-fswitch"
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
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-makefile-manager"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-makefile-manager"
  },
  ["vim-matlab"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-matlab"
  },
  ["vim-matlab-behave"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-matlab-behave"
  },
  ["vim-monokai"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-monokai"
  },
  ["vim-niceblock"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-niceblock"
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
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-prism"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-prism"
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
  ["vim-smartchr"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-smartchr"
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
  ["vim-test"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-tmux-runner"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmux-runner"
  },
  ["vim-tmux-send"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmux-send"
  },
  ["vim-tmuxify"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-tmuxify"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimcmdline = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimcmdline"
  },
  ["vimshell.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimshell.vim"
  },
  vimspector = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vimspector"
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
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/i/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Prosession lua require("packer.load")({'vim-obsession'}, { cmd = "Prosession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-ruby'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
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
