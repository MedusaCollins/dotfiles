-- Keymaps are automatically loaded on the meryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", "<cmd>undo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "<cmd>redo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Tab>", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Escape>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.o.guifont = "Monospace:h11"
