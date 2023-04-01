return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      dir = "~/iCloud/Documents/my-vault",
      daily_notes = {
        folder = "daily",
      },
    })
  end,
  lazy = false,
}
