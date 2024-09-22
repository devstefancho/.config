return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "icon",
      },
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
      },
    })
    vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "[Oil] [F]ile [E]xplorer" })
  end,
}
