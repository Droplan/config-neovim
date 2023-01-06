local o = vim.opt
local g = vim.g

-- Allow backspace everywhere
o.backspace = { 'indent', 'eol', 'start' }
-- Показывает вертикальную красную линию после указанного количества колонок
o.colorcolumn = { 100 }
-- Show tab completion window
o.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Invisible split separators
o.fillchars = { vert = ' ' }
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
-- Read `vim:` modelines
o.modeline = true
-- Включаем поддержку мыши
o.mouse = 'a'
o.mousemodel = 'extend'
vim.keymap.set('', '<C-LeftMouse>', '<Nop>')
-- Показывает `--MODE-- в нижней линии
o.showmode = true
-- Show both line numbers AND relative numbers
o.number = true
o.relativenumber = true
-- Устанавливает 1 таб равным 4 пробела
o.tabstop = 4
o.shiftwidth = 4
-- Display tabs
o.listchars = { tab = '| ' }
o.list = true
-- More intuitive split directions
o.splitbelow = true
o.splitright = true
-- Позволяет Nvim установить заголовок окна терминала
o.title = true
-- Enable undo persistence
o.undofile = true
-- Использует системный буфер обмена
o.clipboard = 'unnamedplus'
-- Говорит NeoVim, что клавиша <Leader> это пробел
g.mapleader = ' '

-- Включить подсветку поиска во время поиска и отключить её впоследствии
vim.cmd [[ augroup VimIncsearchHl ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd CmdlineEnter [/\?] set hlsearch ]]
vim.cmd [[ autocmd CmdlineLeave [/\?] set nohlsearch ]]
vim.cmd [[ augroup END ]]

-- Подсветить на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)
