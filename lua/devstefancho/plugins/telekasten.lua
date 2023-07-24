return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "mattn/calendar-vim" },
  init = function()
    vim.cmd([[ let g:calendar_diary="~/Vault/daily" ]])
  end,
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/Vault"),
    })
  end,
}
