return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("devstefancho.ui.dashboard").config)
    end,
    cond = function()
      -- check if vimr is opened
      if vim.fn.has("gui_vimr") == 1 then
        return false
      end
      return true
    end,
  },
}
