return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      if vim.fn.has("gui_vimr") == 1 then
        require("alpha").setup(require("devstefancho.ui.vimr-dashboard").config)
      else
        require("alpha").setup(require("devstefancho.ui.dashboard").config)
      end
    end,
    cond = require("devstefancho.plugins_status").plugins_status["alpha-nvim"],
  },
}
