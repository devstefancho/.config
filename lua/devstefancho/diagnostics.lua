-- Hide virtual inline diagnostic message
vim.diagnostic.config({
  virtual_text = { severity = "ERROR" },
  underline = { severity = "WARN" },
  signs = true,
})
