return {
	{
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'onedark'
		end,
	},

	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			char = '┊',
			show_trailing_blankline_indent = false,
		},
	},
}

