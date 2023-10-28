return {
	{
	-- Magit in neovim
	  "NeogitOrg/neogit",
	  dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim",        -- optional
		-- "ibhagwan/fzf-lua",              -- optional
	  },
	  config = true
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
}
