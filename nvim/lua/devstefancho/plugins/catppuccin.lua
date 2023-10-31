return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      custom_highlights = function(colors)
        return {
          Visual = { bg = "#2d59a1" },
        }
      end,
    })
    vim.cmd("colorscheme catppuccin")
  end,
  cond = require("devstefancho.plugins_status").plugins_status["catppuccin"],
}
