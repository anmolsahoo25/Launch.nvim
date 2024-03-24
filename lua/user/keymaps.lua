local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Unbind tilde
keymap("n", "`", "", opts)

-- Rebind leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quick keybinds
keymap("n", "<leader>w", ":w!<CR>", opts)

-- Tab navigation
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)
keymap("n", "<leader>4", "4gt", opts)
keymap("n", "<leader>5", "5gt", opts)
keymap("n", "<C-p>", ":tabnext<cr>", opts)
keymap("n", "<C-o>", ":tabprev<cr>", opts)
keymap("n", "<C-n>", ":tabnew<cr>", opts)
