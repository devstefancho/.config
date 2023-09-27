return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- mocha colors {https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua}
      local mocha = require("catppuccin.palettes").get_palette("mocha")

      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "thin",
          show_close_icon = false,
          show_buffer_close_icons = false,
          color_icons = true,
          truncate_names = false,
          diagnostics = "nvim_lsp",
          -- name_formatter = function(buf)
          --   return buf.path -- show full path in bufferline
          -- end,
        },
        -- fg is font-color, bg is background-color
        highlights = require("catppuccin.groups.integrations.bufferline").get({
          styles = { "italic", "bold" },
          custom = {
            all = {
              fill = { bg = mocha.base }, -- background color for rest area of bufferline
            },
            mocha = {
              background = {
                fg = mocha.surface1, -- inactive buffer font color
              },
            },
            latte = {
              background = { fg = "#000000" },
            },
          },
        }),
      })
    end,
  },
}
