local M = {}

local keymap = vim.keymap.set
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- Default Keymaps for LSP
local on_attach_keymaps = function()
  require("devstefancho.nvim-lsp.lspsaga").mapping()
  -- Keymap (https://github.com/neovim/nvim-lspconfig#suggested-configuration)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP [C]ode [A]ction", buffer = 0 })
  keymap("n", "gD", vim.lsp.buf.declaration, { desc = "LSP [g]o to [D]eclaration", buffer = 0 })
  keymap("n", "gd", vim.lsp.buf.definition, { desc = "LSP [g]o to [d]efinition", buffer = 0 })
  keymap("n", "gi", vim.lsp.buf.implementation, { desc = "LSP [g]o to [i]mplementation", buffer = 0 })

  keymap("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help Documentation" })
  keymap("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP [r]ename", buffer = 0 }) -- same as
end

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
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

-- For Typescript Server
function M.tsserver_on_attach(client, bufnr)
  -- See {https://github.com/typescript-language-server/typescript-language-server/issues/216}
  on_attach_keymaps()
  enable_format_on_save(client, bufnr)
end

function M.lua_on_attach(client, bufnr)
  -- See {https://github.com/typescript-language-server/typescript-language-server/issues/216}
  on_attach_keymaps()
  enable_format_on_save(client, bufnr)
end

function M.on_attach(_, bufnr)
  on_attach_keymaps()
end

return M
