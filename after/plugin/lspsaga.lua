local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
keymap("n", "<leader>dg", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Diagnostic
keymap("n", "<leader>dd", "<Cmd>Lspsaga hover_doc<CR>", opts) -- Doc
keymap("n", "<leader>gd", "<Cmd>Lspsaga lsp_finder<CR>", opts) -- Go Definition
keymap("n", "<leader>dh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Help
keymap("n", "<leader>dp", "<Cmd>Lspsaga peek_definition<CR>", opts) -- Peek
keymap("n", "<leader>dr", "<Cmd>Lspsaga rename<CR>", opts) -- Rename
