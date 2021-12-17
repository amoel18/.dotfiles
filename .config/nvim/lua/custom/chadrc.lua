-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "uwu",
}

M.plugins = {
   default_plugin_config_replace = {
      lspconfig = "custom.plugins.lspconfig",
   },
}


M.mappings = {
   -- custom = {}, -- custom user mappings

   misc = {

   },
 }






M.mappings.plugins = {
   comment = {
      toggle = "cc",
   },


   nvimtree = {
      toggle = "-",
   },
}




return M