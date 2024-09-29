return {
  -- Code Formatting
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls
  config = function()
    require("devstefancho.nvim-lsp.mason-null-ls").setup()
  end,
  cond = require("devstefancho.plugins_status").plugins_status["null-ls"],
}
