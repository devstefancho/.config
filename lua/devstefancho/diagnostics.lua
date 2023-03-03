local icons = require("devstefancho.icons")

-- Hide virtual inline diagnostic message
vim.diagnostic.config({
  virtual_text = { severity = "ERROR" },
  underline = { severity = "WARN" },
  signs = true,
})

local function sign_define(name, text)
  vim.fn.sign_define(name, { text = text, texthl = name, numhl = name })
end

local signs = {
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
  sign_define(sign.name, sign.text)
end
