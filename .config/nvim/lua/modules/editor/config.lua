local config = {}

function config.delimimate()
	require 'delimimate'.setup {
  	delimitMate_expand_cr = 1;
		delimitMate_expand_space = 1;
		delimitMate_smart_quotes = 1;
		delimitMate_autoclose = 1;
		delimitMate_smart_matchpairs = 1;
		delimitMate_expand_inside_quotes = 1;
		delimitMate_matchpairs = "(:),[:],{:},<:>";
		delimitMate_quotes = "\" ' ` *";
		delimitMate_expand_space = 1;
		delimitMate_jump_expansion = 1;
		delimitMate_balance_matchpairs = 1;
		delimitMate_excluded_regions = "Comment,String";
		delimitMate_excluded_ft = "mail,txt";
  	vim.api.nvim_command('au FileType c,perl let b:delimitMate_insert_eol_marker = 2');
  	vim.api.nvim_command('au FileType c,perl let b:delimitMate_eol_marker = ";"');
  	vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
	}
end

function config.nvim_colorizer()
  require 'colorizer'.setup {
    css = { rgb_fn = true; };
    lua = { rgb_fn = true; };
    rs = { rgb_fn = true; };
    scss = { rgb_fn = true; };
    sass = { rgb_fn = true; };
    stylus = { rgb_fn = true; };
    vim = { rgb_fn = true;};
    vim = { names = true; };
    tmux = { names = false; };
    'javascript';
    'javascriptreact';
    'typescript';
    'typescriptreact';
    html = {
      mode = 'foreground';
    }
  }
end

function config.vim_cursorwod()
  vim.api.nvim_command('augroup user_plugin_cursorword')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
  vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
  vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
  vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
  vim.api.nvim_command('augroup END')
end

return config
