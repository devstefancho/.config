-- [[ Keymaps ]]
local keymap = function(lhs, rhs, desc)
  if desc then
    desc = "[Lspsaga] " .. desc
  end

  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

-- Diagnostic
keymap("<leader>do", "<Cmd>Lspsaga show_line_diagnostics<CR>", "[D]iagnostics [O]pen") -- same as vim.diagnostic.open_float
keymap("<leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "[d]iagnostic [p]rev") -- same as vim.diagnostic.goto_prev
keymap("<leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", "[d]iagnostic [n]ext") -- same as vim.diagnostic.goto_next

-- Definition
keymap("<leader>gd", "<Cmd>Lspsaga lsp_finder<CR>", "[g]o to [d]efinition of usages") -- Show usages
keymap("<leader>pd", "<Cmd>Lspsaga peek_definition<CR>", "[p]eek [d]efinition") -- Peek

-- See `:help K` for why this keymap
keymap("K", "<Cmd>Lspsaga hover_doc<CR>", "hover doc") -- same as vim.lsp.buf.hover
