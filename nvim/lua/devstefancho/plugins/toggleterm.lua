return {
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
    cond = require("devstefancho.plugins_status").plugins_status["toggleterm"],
  },
}
