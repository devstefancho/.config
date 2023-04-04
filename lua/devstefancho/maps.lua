local keymap = vim.keymap.set

-- Do not yank with x
keymap("n", "x", '"_x')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Esc
keymap("i", "jk", "<ESC>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap("n", "te", ":tabedit<CR>", { silent = true })
keymap("n", "ss", ":split<CR><C-w>w", { silent = true })
keymap("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

-- Move window
keymap("", "s<left>", "<C-w>h")
keymap("", "s<up>", "<C-w>k")
keymap("", "s<down>", "<C-w>j")
keymap("", "s<right>", "<C-w>l")
keymap("", "<leader>h", "<C-w>h")
keymap("", "<leader>k", "<C-w>k")
keymap("", "<leader>j", "<C-w>j")
keymap("", "<leader>l", "<C-w>l")

-- Resize window
keymap("n", "<left>", ":vertical resize -2<CR>") -- increase
keymap("n", "<right>", ":vertical resize +2<CR>") -- decrease
keymap("n", "<up>", ":resize +2<CR>") -- increase
keymap("n", "<down>", ":resize -2<CR>") -- decrease

-- HightLighting
keymap("n", "<leader>n", ":noh<CR>")

-- Delete to void register, then paste previous register
keymap("v", "<leader>p", '"_dP')

-- Tab Movement
-- # Caution!! Do not use <Tab> for keymap, <Tab> is vim major key for jump motions (see :help jump-motions)
keymap("n", "H", "<Cmd>BufferLineCyclePrev<CR>") -- go to prev buffer
keymap("n", "L", "<Cmd>BufferLineCycleNext<CR>") -- go to next buffer

-- Rotate Quickfix List
-- [[ Warning ]] Do not use keymap starting with q such as q[ q], q is important key for quitting window
keymap("n", "]q", "<Cmd>cnext<CR>")
keymap("n", "[q", "<Cmd>cprev<CR>")

-- Move Lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
