-- Insert Mode
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Delete word backward in insert mode" })
vim.keymap.set("i", "<C-Enter>", "<Esc>o", { desc = "Insert newline below and return to insert mode" })
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { silent = true, expr = false, noremap = true })
vim.keymap.set("i", "<C-z>", "<C-o>u", { silent = true, expr = false, noremap = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward in insert mode" })

-- Normal Mode
vim.keymap.set("n", "<C-z>", "<cmd>undo<CR>", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<c-a>", "ggVG", { desc = "Select all content" })
vim.keymap.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true, desc = "Move cursor down" })
vim.keymap.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true, desc = "Move cursor up" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice" })
vim.keymap.set("n", "<leader><Up>", "0k", { noremap = true })
vim.keymap.set("n", "<leader><Down>", "0j", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
vim.keymap.set("n", "<C-Right>", "<cmd>wincmd l<CR>", { noremap = true, silent = true, desc = "Move focus right" })
vim.keymap.set("n", "<C-Left>", "<cmd>wincmd h<CR>", { noremap = true, silent = true, desc = "Move focus left" })
vim.keymap.set("n", "<C-Up>", "<cmd>wincmd k<CR>", { noremap = true, silent = true, desc = "Move focus up" })
vim.keymap.set("n", "<C-Down>", "<cmd>wincmd j<CR>", { noremap = true, silent = true, desc = "Move focus down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":s/", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-f>", "/", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "#", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Esc>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Visual Mode
vim.keymap.set("v", "<leader><Up>", "0k", { noremap = true })
vim.keymap.set("v", "<leader><Down>", "0j", { noremap = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-g>", ":s/", { noremap = true })

-- Terminal Mode
vim.api.nvim_set_keymap("t", "<C-Esc>", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-Up>", "<Cmd>wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-Down>", "<Cmd>wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Left>", ":bprev<CR>", { noremap = true, silent = true })
