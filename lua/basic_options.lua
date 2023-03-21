local o = vim.opt
local g = vim.g

-- Allow backspace everywhere
o.backspace = { 'indent', 'eol', 'start' }
-- Показывает вертикальную красную линию после указанного количества колонок
o.colorcolumn = { 120 }
-- Show tab completion window
o.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Explicit folding
o.foldmethod = 'marker'
-- Enable RGB colors
o.termguicolors = true
-- Hide abandoned buffers
o.hidden = true
-- Preview s/// changes
o.inccommand = 'nosplit'
-- Игнорировать регистр букв при поиске
o.ignorecase = true
o.smartcase = true
-- Подстраивает новый строки под предыдущий отступ
o.smartindent = true
-- Read `vim:` modelines
o.modeline = true
-- Включаем поддержку мыши
o.mouse = 'a'
o.mousemodel = 'extend'
vim.keymap.set('', '<C-LeftMouse>', '<Nop>')
-- Показывает номер текущей строки, остальные строки нумерует относительно текущей
o.number = true
o.relativenumber = true
-- Устанавливает 1 таб равным 4 пробела
o.tabstop = 4
o.shiftwidth = 4
-- Display tabs
o.listchars = { tab = '| ' }
o.list = true
-- Более интуитивное разделение окна
o.splitbelow = true
o.splitright = true
-- Позволяет Nvim установить заголовок окна терминала
o.title = true
-- Включить постоянную отмену
o.undofile = true
-- Использует системный буфер обмена
o.clipboard = 'unnamedplus'
-- Говорит NeoVim, что клавиша <Leader> это пробел
g.mapleader = ' '
-- Кодировка файлов
o.encoding = 'utf-8'
-- Подсветка строки с курсором
o.cursorline = true

-- Options from kickstart.nvim
-- Enable break indent
o.breakindent = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250
o.timeout = true
o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
-- End options from kickstart.nvim

-- Включить подсветку поиска во время поиска и отключить её впоследствии
vim.cmd [[ augroup VimIncsearchHl ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd CmdlineEnter [/\?] set hlsearch ]]
vim.cmd [[ autocmd CmdlineLeave [/\?] set nohlsearch ]]
vim.cmd [[ augroup END ]]

-- Подсветить на доли секунды скопированную часть текста
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
