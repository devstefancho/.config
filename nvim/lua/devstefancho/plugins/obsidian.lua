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

    vim.keymap.set("n", "<M-o>", "<Cmd>ObsidianQuickSwitch<CR>", { desc = "[Obsidian] Quick Search" })
  end,
  lazy = false,
}
