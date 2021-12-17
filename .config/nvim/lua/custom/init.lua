-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!


local hooks = require "core.hooks"

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
   map("n", "<leader>cc", ":Telescope <CR>"  )
   map("n", "<leader>q", ":q! <CR>"  )
   map("n", "q", ":call ExitBuffer()<CR>"  )
   map("n", "<leader>w", ":w! <CR>"  )
   map("n", "<C-q>", ":wqa!<CR>"  )
   map('n', '<Leader>c', ':Copen<CR>'  )
   map("n", "0", "^"  )
   map("n", "$", "g_"  )
   map("n", "j", "gj"  )
   map("n", "k", "gk"  )
   map('v', '<TAB>', '>gv' )
   map('v', '<S-TAB>', '<gv' )
   map('n', '<leader>,', ':RunCode<CR>', { noremap = true, silent = false })
   map('n', '<leader>,f', ':RunFile<CR>', { noremap = true, silent = false })
   map('n', '<leader>,p', ':RunProject<CR>', { noremap = true, silent = false })
   map('n', '<leader>,cf', ':CRFiletype<CR>', { noremap = true, silent = false })
   map('n', '<leader>,cp', ':CRProjects<CR>', { noremap = true, silent = false })
   map('n', '+', ':lua require("harpoon.mark").add_file()<CR>'  )
   map('n', '=', ':lua require("harpoon.ui").toggle_quick_menu()<CR>'  )
   map('n', '<leader>r', ':lua require("harpoon.term").sendCommand(1, require("code_runner").get_filetype_command() .. "\n")<CR>'  )
   -- map('n', '<localleader>1', ':lua require("harpoon.tmux").sendCommand(1, 1)',  )
   -- map('n', '<localleader>2', ':lua require("harpoon.tmux").sendCommand(2, 1)<CR>',  )
   -- map('n', '<localleader>3', ':lua require("harpoon.tmux").sendCommand(3, 1)<CR>',  )
   -- map('n', '<localleader>4', ':lua require("harpoon.tmux").sendCommand(4, 1)<CR>',  )
   -- map('n', '<localleader>5', ':lua require("harpoon.tmux").sendCommand(5, 1)<CR>',  )
   -- map('n', '<localleader>6', ':lua require("harpoon.tmux").sendCommand(6, 1)<CR>',  )
   -- map('n', '<localleader>7', ':lua require("harpoon.tmux").sendCommand(7, 1)<CR>',  )
   -- map('n', '<localleader>8', ':lua require("harpoon.tmux").sendCommand(8, 1)<CR>',  )
end)


-- NOTE :   is a variable  there (most likely a table if you want multiple  ions),
-- you can remove it if you dont have any custom  ions

-- Install plugins
-- To add new plugins, use the "install_plugin" hook,

-- examples below:

hooks.add("install_plugins", function(use)

  use {
     "jpalardy/vim-slime",
   }

--  use { "nathom/filetype.nvim",    -- Stop sourcing filetype.vim
--   vim.g.did_load_filetypes = 1 }

  use {
     "unblevable/quick-scope",
   }

   use {
     "Rasukarusan/nvim-block-paste",
   }

   use {
     "AckslD/nvim-neoclip.lua",
     config = function()
       require('neoclip').setup()
     end,
   }
   use { "tversteeg/registers.nvim", }

   use {
     "bkad/CamelCaseMotion",
   }

   use {
     "pappasam/nvim-repl",
   }

   use {
     "lervag/vimtex",
   }

   use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
   }

   use {
      "williamboman/nvim-lsp-installer",
      config = function()
         local lsp_installer = require "nvim-lsp-installer"

         lsp_installer.on_server_ready(function(server)
            local  s = {}

            server:setup( s)
            vim.cmd [[ do User LspAttachBuffers ]]
         end)
      end,
   }

   use {
     "romgrk/github-light.vim",
   }

   use {
   "Pocco81/AutoSave.nvim",
   config = function()
      local autosave = require "autosave"

      autosave.setup {
         enabled = true,
         execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
         events = { "InsertLeave", "TextChanged" },
         conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true,
         },
         clean_command_line_interval = 2500,
         on_off_commands = true,
         write_all_buffers = false,
      }
   end,
   }

   use {
      "CRAG666/code_runner.nvim",
   }

   use {
     "projekt0n/github-nvim-theme",
   }

   use {
     'ThePrimeagen/harpoon',
   }

   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
      end,
   }


   use {
     "machakann/vim-highlightedyank",
   }

   use {
     "chrisbra/csv.vim",
   }

   use {
     "Mangeshrex/uwu.vim",
   }

   use {
     "olimorris/onedarkpro.nvim"
   }
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
--

