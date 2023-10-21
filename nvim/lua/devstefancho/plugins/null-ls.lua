return {
  -- Code Formatting
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls
  cond = require("devstefancho.plugins_status").plugins_status["null-ls"],
}
