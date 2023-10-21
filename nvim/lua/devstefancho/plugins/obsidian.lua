return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      dir = "~/iCloud/Documents/my-vault",
      daily_notes = {
        folder = "daily",
      },
      templates = {
        subdir = "templates",
      },
      disable_frontmatter = true,
    })
  end,
  lazy = false,
  cond = require("devstefancho.plugins_status").plugins_status["obsidian"],
}
