return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme catppuccin")
  end,
  cond = require("devstefancho.plugins_status").plugins_status["catppuccin"],
}
