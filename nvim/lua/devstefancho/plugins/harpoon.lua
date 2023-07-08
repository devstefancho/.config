return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      local keymap = require("devstefancho.utils").createKeymap("Harpoon")

      keymap("<leader>a", mark.add_file, "[a]dd a file")
      keymap("<C-e>", ui.toggle_quick_menu, "[e]xplore files")
    end,
  },
}
