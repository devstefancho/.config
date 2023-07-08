local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
  return
end

local icons = require("devstefancho.icons")

indent_blankline.setup({
  char = icons.ui.LineLeft,
})
