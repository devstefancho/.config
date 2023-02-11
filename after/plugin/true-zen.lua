local status, true_zen = pcall(require, "true-zen")
if not status then
  return
end

true_zen.setup({
  modes = {
    ataraxis = {
      padding = {
        left = 52,
        right = 52,
        top = 35,
        bottom = 35,
      },
      callbacks = {
        open_pre = function()
          require("lualine").hide()
        end,
        close_pre = function()
          require("lualine").hide({ unhide = true })
        end,
      },
    },
  },
})
