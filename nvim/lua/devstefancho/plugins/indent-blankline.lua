return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl")
    local icons = require("devstefancho.icons")

    ibl.setup({
      indent = {
        char = icons.ui.LineLeft,
      },
    })
  end,
}
