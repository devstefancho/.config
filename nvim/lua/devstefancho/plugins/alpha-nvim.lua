return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local vimwiki = require("devstefancho.vimwiki")
      if vimwiki.is_current_path_wiki() then
        require("alpha").setup(require("devstefancho.ui.wiki-dashboard").config)
      else
        require("alpha").setup(require("devstefancho.ui.dashboard").config)
      end
    end,
    cond = require("devstefancho.plugins_status").plugins_status["alpha-nvim"],
  },
}
