local keymap = require("devstefancho.utils").createKeymap("Lspsaga")

-- Diagnostic
keymap("<leader>do", "<Cmd>Lspsaga show_line_diagnostics<CR>", "[D]iagnostics [O]pen") -- same as vim.diagnostic.open_float
keymap("[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "[d]iagnostic [p]rev") -- same as vim.diagnostic.goto_prev
keymap("]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", "[d]iagnostic [n]ext") -- same as vim.diagnostic.goto_next

-- Definition
-- keymap("<leader>gd", "<Cmd>Lspsaga lsp_finder<CR>", "[g]o to [d]efinition of usages") -- Show usages
-- keymap("<leader>pd", "<Cmd>Lspsaga peek_definition<CR>", "[p]eek [d]efinition") -- Peek

-- See `:help K` for why this keymap
keymap("K", "<Cmd>Lspsaga hover_doc<CR>", "hover doc") -- same as vim.lsp.buf.hover
