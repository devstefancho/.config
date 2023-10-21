return {
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    config = function()
      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true
      require("devstefancho.nvim-tree.setup")
      require("devstefancho.nvim-tree.maps")
    end,
    cond = require("devstefancho.plugins_status").plugins_status["nvim-tree"],
  },
}
