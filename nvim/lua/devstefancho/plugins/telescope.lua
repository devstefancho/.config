return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension("frecency")
        end,
        dependencies = { "kkharji/sqlite.lua" },
      },
    },
    config = function()
      require("devstefancho.telescope.setup")
      require("devstefancho.telescope.maps")
    end,
    cond = require("devstefancho.plugins_status").plugins_status["telescope"],
  },
}
