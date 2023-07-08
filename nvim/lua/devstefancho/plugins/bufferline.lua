return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "thin",
          show_close_icon = false,
          show_buffer_close_icons = false,
          color_icons = true,
          truncate_names = false,
          diagnostics = "nvim_lsp",
        },
        -- fg is font-color, bg is background-color
        highlights = {
          separator = {},
          separator_selected = {},
          background = { -- inactive buffers
          },
          buffer_selected = {
            bold = true,
          },
          fill = {},
        },
      })
    end,
  },
}
