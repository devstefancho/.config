return {
  {
    "ThePrimeagen/harpoon",
    cond = require("devstefancho.plugins_status").plugins_status["harpoon"],
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup({
        menu = {
          width = math.min(vim.api.nvim_win_get_width(0) - 4, 120),
        },
      })

      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      local keymap = require("devstefancho.utils").createKeymap("Harpoon")

      keymap("<leader>a", mark.add_file, "[a]dd a file")
      keymap("<C-e>", ui.toggle_quick_menu, "[e]xplore files")

      keymap("<C-y>", function()
        ui.nav_file(1)
      end)
      keymap("<C-g>", function()
        ui.nav_file(2)
      end)
    end,
  },
}
