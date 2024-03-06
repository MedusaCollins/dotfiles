vim.g.mapleader = ' '

vim.keymap.set(
  'i',
  '<C-BS>',
  '<C-w>',
  { desc = 'Delete word backward in insert mode' }
)
vim.keymap.set(
  'i',
  '<C-H>',
  '<C-w>',
  { desc = 'Delete word backward in insert mode' }
)
vim.keymap.set(
  'n',
  '<C-BS>',
  'db',
  { desc = 'Delete word backward in normal mode' }
)

vim.keymap.set('i', '<C-s>', function()
  vim.cmd [[write]]
  vim.cmd [[stopinsert]]
end, {
  silent = true,
  expr = false,
  noremap = true,
  desc = 'Save and return to normal mode in insert mode',
})
vim.keymap.set(
  'n',
  '<C-w>',
  '<cmd>bd<CR>',
  { noremap = true, silent = true, desc = 'Close buffer' }
)
vim.keymap.set(
  'n',
  '<C-s>',
  '<cmd>w<CR>',
  { noremap = true, silent = true, desc = 'Save' }
)
vim.keymap.set(
  'n',
  '<C-z>',
  '<cmd>undo<CR>',
  { noremap = true, silent = true, desc = 'Undo' }
)

vim.keymap.set(
  'i',
  '<C-z>',
  '<C-o>u',
  { silent = true, expr = false, noremap = true, desc = 'Undo in insert mode' }
)
vim.keymap.set('i', '<C-Enter>', '<Esc>o', {
  silent = true,
  expr = false,
  noremap = true,
  desc = 'Insert newline below and return to insert mode',
})

vim.keymap.set(
  'i',
  '<C-y>',
  '<C-r>',
  { silent = true, expr = false, noremap = true, desc = 'Redo in insert mode' }
)

vim.keymap.set(
  'n',
  '<C-y>',
  '<cmd>redo<CR>',
  { noremap = true, silent = true, desc = 'Redo' }
)
vim.keymap.set(
  'n',
  '<C-o>',
  '<cmd>Telescope find_files<CR>',
  { noremap = true, silent = true, desc = 'Search files with Telescope' }
)
vim.keymap.set(
  'n',
  '<C-Tab>',
  '<cmd>Telescope buffers<CR>',
  { noremap = true, silent = true, desc = 'Search buffers with Telescope' }
)

vim.keymap.set(
  'n',
  '<C-S-Right>',
  'vwe',
  { noremap = true, desc = 'Select word to right with Ctrl+Shift+Right Arrow' }
)
vim.keymap.set(
  'n',
  '<C-S-Left>',
  'bve',
  { noremap = true, desc = 'Select word to left with Ctrl+Shift+Left Arrow' }
)
vim.keymap.set(
  'n',
  '<C-S-Up>',
  'vek',
  { noremap = true, desc = 'Select word to up with Ctrl+Shift+Up Arrow' }
)
vim.keymap.set(
  'n',
  '<C-S-Down>',
  'vej',
  { noremap = true, desc = 'Select word to down with Ctrl+Shift+Down Arrow' }
)

vim.keymap.set(
  'i',
  '<C-S-Right>',
  '<Esc>vwea',
  { noremap = true, desc = 'Select word to right with Ctrl+Shift+Right Arrow' }
)
vim.keymap.set(
  'i',
  '<C-S-Left>',
  '<Esc>bvea',
  { noremap = true, desc = 'Select word to left with Ctrl+Shift+Left Arrow' }
)
vim.keymap.set(
  'i',
  '<C-S-Up>',
  '<Esc>vek',
  { noremap = true, desc = 'Select word to up with Ctrl+Shift+Up Arrow' }
)
vim.keymap.set(
  'i',
  '<C-S-Down>',
  '<Esc>vej',
  { noremap = true, desc = 'Select word to down with Ctrl+Shift+Down Arrow' }
)

vim.keymap.set('n', '<c-a>', 'ggVG', { desc = 'Select all content' })
vim.keymap.set(
  { 'n', 'x' },
  '<leader>p',
  '"0p',
  { desc = 'Paste from register 0' }
)

vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save and quit' })
vim.keymap.set(
  'n',
  'j',
  [[v:count?'j':'gj']],
  { noremap = true, expr = true, desc = 'Move cursor down' }
)
vim.keymap.set(
  'n',
  'k',
  [[v:count?'k':'gk']],
  { noremap = true, expr = true, desc = 'Move cursor up' }
)

vim.keymap.set('n', '<C-c>', '"+y', {
  silent = true,
  expr = false,
  noremap = true,
  desc = 'Copy selected text to system clipboard',
})

vim.keymap.set(
  'n',
  '<C-ö>',
  ':<C-u>call feedkeys("Vgc")<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'v',
  '<C-c>',
  '"+y',
  { silent = true, expr = false, noremap = true }
)

vim.keymap.set(
  'i',
  '<C-c>',
  '<Esc>"+y`^a',
  { silent = true, expr = false, noremap = true }
)

-- vim.keymap.set('n', '<C-v>', '"+p', {
-- silent = true,
--   expr = false,
-- noremap = true,
-- desc = 'Paste text from system clipboard',
-- })
vim.keymap.set(
  'v',
  '<C-v>',
  '"+p',
  { silent = true, expr = false, noremap = true }
)
vim.keymap.set(
  'i',
  '<C-v>',
  '<Esc>"+pa',
  { silent = true, expr = false, noremap = true }
)

vim.keymap.set(
  'n',
  '<leader>nh',
  ':nohl<CR>',
  { desc = 'Clear search highlights' }
)
vim.keymap.set(
  'n',
  '<leader>nd',
  '<cmd>NoiceDismiss<CR>',
  { desc = 'Dismiss noice' }
)
