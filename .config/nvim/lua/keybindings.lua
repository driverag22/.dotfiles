local set = vim.opt
-- vim.g.mapleader = " "

-----------------------------------------
---- Telescope:

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Misc:
vim.keymap.set('n', '<C-b>', ':redo<CR>', {noremap = true}) -- redo

--move wrapped lines like normal lines
vim.keymap.set('n', 'j', 'gj', {noremap = true}) 
vim.keymap.set('n', 'k', 'gk', {noremap = true}) 

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Tabs: 

vim.keymap.set('n', '<leader>ot', ':tabnew<CR>', {noremap = true}) -- new tab
vim.keymap.set('n', '<leader>ct', ':tabclose<CR>', {noremap = true}) --close tab
vim.keymap.set('n', '<M-m>', ':tabnext<CR>', {noremap = true}) --move to tab to the right
vim.keymap.set('n', '<M-n>', ':tabprevious<CR>', {noremap = true}) --move to tab to the left

-----------------------------------------
-----------------------------------------

-----------------------------------------
--tasks
vim.keymap.set('n', '<leader>td', ':TaskWikiDelete<CR>', {noremap = true}) -- delete task
vim.keymap.set('n', '<leader>tc', ':TaskWikiCalendar<CR>', {noremap = true}) -- open taskwiki calendar
vim.keymap.set('n', 'tto', ':TaskWikiToggle<CR>', {noremap = true}) -- open taskwiki calendar

-----------------------------------------
-----------------------------------------

-----------------------------------------
--tex
vim.keymap.set('n', 'ctx', ':VimtexCompile<CR>', {noremap = true}) -- Toggle tex compile
-----------------------------------------
-----------------------------------------


-----------------------------------------
--Lsp

local function nkeymap(key, map)
	vim.keymap.set('n', key, map, {noremap = true})
end
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>') -- go to definition
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>') -- go to declaration
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>') -- go to implementation
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>') -- 
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>') -- 
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>') -- get all references 
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>') -- get type definition
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>') -- documentation 
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>') -- 
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>') -- 
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>') -- rename

-- vim.keymap.set('n', 'mm', codewindow.toggle_minimap())

-----------------------------------------
-----------------------------------------


vim.cmd ([[
    " map < { + Enter > to automatically add second "}"
    inoremap {<Enter> {<Enter>}<Esc>O
]])
