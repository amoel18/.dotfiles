local config = {}

function config.nvim_lsp()
  require('modules.completion.lsp')
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
		autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
		throttle_time = 80,
		source_timeout = 200,
		incomplete_delay = 400,
		max_abbr_width = 100,
		max_kind_width = 100,
		max_menu_width = 100,
		documentation = true,
    source = {
		  buffer = { kind = "﬘", true },
		  -- luasnip = { kind = "﬌", true },
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      --spell = true;
      --tags = true;
      snippets_nvim = false;
		  --treesitter = true;
    };
  }
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = '/home/i/.config/nvim/snippets'
end

function config.vim_sonictemplate()
  vim.g.sonictemplate_postfix_key = '<C-,>'
  vim.g.sonictemplate_vim_template_dir = os.getenv("HOME").. '/.config/nvim/template'
end



function config.smart_input()
  require('smartinput').setup {
    ['go'] = { ';',':=',';' }
  }
end

function config.emmet()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = 'i'
end




return config
