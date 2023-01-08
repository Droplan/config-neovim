
-- Installing packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system {
			'git', 'clone', 'https://github.com/wdthomason/packer.nvim', install_path
		}
end

local packer = require 'packer'
packer.init {
	compile_path = fn.stdpath('data')..'/packer_compiled.lua',
}
local use = packer.use

-- Packer manager itself
use {'wbthomason/packer.nvim'}

-- LSP
use {
	'neovim/nvim-lspconfig',
}
use {
	'williamboman/mason.nvim',
}
use {
	'williamboman/mason-lspconfig.nvim',
}
-- Fuzzy finder
use {
	'nvim-telescope/telescope.nvim',
	requires = {
		{'nvim-lua/popup.nvim'},
		{'nvim-lua/plenary.nvim'},
		{'kyazdani42/nvim-web-devicons'},
	},
}
use 'nvim-telescope/telescope-symbols.nvim'
use {
	'debugloop/telescope-undo.nvim',
	config = function() require('telescope').load_extension 'undo' end
}
-- LSP stub for non-LS languages
use {
	'jose-elias-alvarez/null-ls.nvim',
	requires = {
		{'nvim-lua/plenary.nvim'},
	},
	config = function()
		local null_ls = require 'null-ls'
		null_ls.setup {
			sources = {
				null_ls.builtins.diagnostics.shellcheck.with {
					runtime_condition = function()
						return vim.fn.executable('shellcheck') == 1
					end
				},
				null_ls.builtins.code_actions.shellcheck.with {
					runtime_condition = function()
						return vim.fn.executable('shellcheck') == 1
					end
				},
				null_ls.builtins.formatting.jq.with {
					runtime_condition = function()
						return vim.fn.executable('jq') == 1
					end,
				},
			}
		}
	end
}
-- Pretty LSP diagnostics
use {
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	config = function()
		require('lsp_lines').setup()
	end
}
-- LSP progress
use {
	'j-hui/fidget.nvim',
	config = function() require('fidget').setup{} end
}
-- Status line
use {
	'SmiteshP/nvim-navic',
	config = function()
		require('nvim-navic').setup {
			separator = "  ",
		}
	end,
}
use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', 'SmiteshP/nvim-navic' },
}
-- Completion engine
use {
	'hrsh7th/nvim-cmp',
	requires = {
		'hrsh7th/vim-vsnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-calc',
		'hrsh7th/cmp-nvim-lua',
		'kdheepak/cmp-latex-symbols',
	},
}

