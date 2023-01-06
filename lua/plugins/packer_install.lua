
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
