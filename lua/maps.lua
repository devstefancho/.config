local keymap = vim.keymap

vim.g.mapleader = " "

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Esc
keymap.set("i", "jk", "<ESC>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<CR>", { silent = true })
keymap.set("n", "ss", ":split<CR><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

-- Move window
keymap.set("n", "<leader><leader>", "<C-w>w", { silent = true })
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "<leader>h", "<C-w>h")
keymap.set("", "<leader>k", "<C-w>k")
keymap.set("", "<leader>j", "<C-w>j")
keymap.set("", "<leader>l", "<C-w>l")

-- Resize window
keymap.set("n", "<left>", ":vertical resize -2<CR>") -- increase
keymap.set("n", "<right>", ":vertical resize +2<CR>") -- decrease
keymap.set("n", "<up>", ":resize +2<CR>") -- increase
keymap.set("n", "<down>", ":resize -2<CR>") -- decrease

-- HightLighting
keymap.set("n", "<leader>n", ":noh<CR>")

-- Delete to void register, then paste previous register
keymap.set("v", "<leader>p", '"_dP')
