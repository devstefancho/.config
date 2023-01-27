local M = {}

local keymap = vim.keymap.set

function M.mapping()
  -- Diagnostic
  keymap("n", "<leader>do", "<Cmd>Lspsaga show_line_diagnostics<CR>", { desc = "[D]iagnostics [O]pen", buffer = 0 }) -- same as vim.diagnostic.open_float
  keymap("n", "<leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "[d]iagnostic [p]rev", buffer = 0 }) -- same as vim.diagnostic.goto_prev
  keymap("n", "<leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "[d]iagnostic [n]ext", buffer = 0 }) -- same as vim.diagnostic.goto_next

  -- Definition
  keymap("n", "<leader>gd", "<Cmd>Lspsaga lsp_finder<CR>", { desc = "[g]o to [d]efinition of usages", buffer = 0 }) -- Show usages
  keymap("n", "<leader>pd", "<Cmd>Lspsaga peek_definition<CR>", { desc = "[p]eek [d]efinition", buffer = 0 }) -- Peek

  -- See `:help K` for why this keymap
  keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover", buffer = 0 }) -- same as vim.lsp.buf.hover
end

return M
