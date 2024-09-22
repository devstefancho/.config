local keymap = vim.keymap.set

-- Do not yank with x
keymap("n", "x", '"_x')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Esc
keymap("i", "jk", "<ESC>")

-- New tab
keymap("n", "te", ":tabedit<CR>", { silent = true })
keymap("n", "ss", ":split<CR><C-w>w", { silent = true })
keymap("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

-- Move window
keymap("", "<left>", "<C-w>h")
keymap("", "<up>", "<C-w>k")
keymap("", "<down>", "<C-w>j")
keymap("", "<right>", "<C-w>l")

-- HightLighting
keymap("n", "<leader>n", ":noh<CR>")

-- Delete to void register, then paste previous register
keymap("v", "<leader>p", '"_dP')

-- Tab Movement
-- # Caution!! Do not use <Tab> for keymap, <Tab> is vim major key for jump motions (see :help jump-motions)
keymap("n", "H", ":bp<cr>") -- go to prev buffer
keymap("n", "L", ":bn<cr>") -- go to next buffer

-- Rotate Quickfix List
-- [[ Warning ]] Do not use keymap starting with q such as q[ q], q is important key for quitting window
keymap("n", "]q", "<Cmd>cnext<CR>")
keymap("n", "[q", "<Cmd>cprev<CR>")

-- Move Lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Fold
keymap("n", "<s-Tab>", "za")
