local lspconfig = require 'lspconfig'

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	signs = false,
	severity_sort = true,
})

vim.diagnostic.config {
	virtual_text = false,
}


local function capabilities()
	return require('cmp_nvim_lsp').default_capabilities()
end

local navic = require 'nvim-navic'
local function on_attach(client, bufnr)
	navic.attach(client, bufnr)

	-- Semantic tokens
	local hi = vim.api.nvim_set_hl
	hi(0, '@unsafe',   { underdashed = true })
	hi(0, '@trait',    { italic = true })
	hi(0, '@callable', { link = 'Function'})
end

require('lspconfig')['html'].setup{
	capabilities = capabilities(),
    on_attach = on_attach,
}
require('lspconfig')['cssls'].setup{
	capabilities = capabilities(),
    on_attach = on_attach,
}
require('lspconfig')['emmet_ls'].setup{
	capabilities = capabilities(),
    on_attach = on_attach,
}
