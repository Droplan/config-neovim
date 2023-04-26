-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- ============================================================================
-- Управление Neovim, буферами и окнами
-- ============================================================================
vim.keymap.set('n', '<Leader>q', '<Cmd>qa<Cr>', { desc = 'Close neovim' })
vim.keymap.set('n', 'q', '<Cmd>close<Cr>', { desc = 'Close current window' })
-- vim.keymap.set('n', '<Leader>r', '<C-w>x', { desc = 'Swap windows with each other' })
vim.keymap.set('n', '<Tab>', '<Cmd>bn<Cr>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>bp<Cr>', { desc = 'Go to prev buffer' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus to left-side window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus to right-side window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus to top-side window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus to bottom-side window' })
vim.keymap.set({ 'n', 'i', 'x' }, '<C-s>', '<Esc><Cmd>up<Cr>', { desc = 'Save buffer into file' })
vim.keymap.set('n', '<C-->', '<Cmd>vertical resize -2<Cr>', { desc = 'Vertical resize +' })
vim.keymap.set('n', '<C-=>', '<Cmd>vertical resize +2<Cr>', { desc = 'Vertical resize -' })
vim.keymap.set('n', 'tsp', function()
  vim.treesitter.inspect_tree({ command = 'set nonumber | 60vnew' })
end, { desc = 'Open treesitter tree for current buffer' })


-- ============================================================================
-- Передвижения по тексту
-- ============================================================================
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = 'Move cursor down (display and real line)',
})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = 'Move cursor up (display and real line)',
})
vim.keymap.set({ 'i', 't' }, '<C-f>', '<Right>', { desc = 'Move cursor right one letter' })
vim.keymap.set({ 'i', 't' }, '<C-b>', '<Left>', { desc = 'Move cursor left one letter' })
-- vim.keymap.set({ 'i', 't' }, '<C-.>', '<S-Right>', { desc = 'Move cursor right on word' })
-- vim.keymap.set({ 'i', 't' }, '<C-,>', '<S-Left>', { desc = 'Move cursor left on word' })
-- vim.keymap.set({ 'i', 't' }, '<C-p>', '<Up>', { desc = 'Move cursor up one line' })
-- vim.keymap.set({ 'i', 't' }, '<C-n>', '<Down>', { desc = 'Move cursor down one line' })
vim.keymap.set({ 'i', 't' }, '<C-a>', '<Home>', { desc = 'Move cursor to start of the line' })
vim.keymap.set({ 'i', 't' }, '<C-e>', '<End>', { desc = 'Move cursor to end of the line' })
vim.keymap.set({ 'i', 't' }, '<C-d>', '<Delete>', { desc = 'Delete one letter after cursor' })
vim.keymap.set({ 'n', 'x', 'o' }, 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set({ 'n', 'x', 'o' }, 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
