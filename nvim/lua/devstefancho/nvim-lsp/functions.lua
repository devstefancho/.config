local M = {}

local keymap = require("devstefancho.utils").createKeymap("Lsp")
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- [[ LSP ]]
local on_attach_keymaps = function()
  local opts = { buffer = 0 }

  -- Keymap (https://github.com/neovim/nvim-lspconfig#suggested-configuration)
  keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", opts)
  keymap("gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration", opts)
  keymap("gd", vim.lsp.buf.definition, "[g]o to [d]efinition", opts)
  keymap("gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation", opts)
  keymap("gK", vim.lsp.buf.signature_help, { desc = "Signature Help Documentation" })
  keymap("<leader>r", vim.lsp.buf.rename, "[r]ename", opts) -- same as
  keymap("K", vim.lsp.buf.hover, opts)
  keymap("<leader>do", vim.diagnostic.open_float, opts)
  keymap("]d", vim.diagnostic.goto_next, opts)
  keymap("[d", vim.diagnostic.goto_prev, opts)
  keymap("<leader>wks", vim.lsp.buf.workspace_symbol, opts)
  -- vim.keymap.set("i", "<C-m>", vim.lsp.buf.signature_help, opts)
  -- keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
end

-- Filtering table
local filter = function(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

-- Filter for react/index.d.ts in quick fix list
local filterDefinitionFile = function(value)
  local uri = value.uri or value.targetUri
  if not uri then
    return false
  end
  return string.match(uri, "index.d.ts") == nil
end

-- For Typescript Server
M.tsserver_handlers = {
  ["textDocument/definition"] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterDefinitionFile)
      return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
    end

    vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
  end,
}

function M.on_attach(client, bufnr)
  on_attach_keymaps()
end

-- [[ Diagnostics ]]
vim.diagnostic.config({
  virtual_text = { severity = "ERROR" },
  underline = { severity = "WARN" },
  signs = true,
})

local signs = {
  { name = "DiagnosticSignWarn", text = "W" },
  { name = "DiagnosticSignError", text = "E" },
  { name = "DiagnosticSignHint", text = "H" },
  { name = "DiagnosticSignInfo", text = "I" },
}

for _, sign in ipairs(signs) do
  local name = sign.name
  local text = sign.text
  vim.fn.sign_define(name, { text = text, texthl = name, numhl = name })
end

return M
