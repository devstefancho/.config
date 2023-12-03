return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl")
    ibl.setup({
      indent = {
        char = "▏",
      },
    })
  end,
  cond = function()
    return require("devstefancho.plugins_status").plugins_status["indent-blankline"]
  end,
}
