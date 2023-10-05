return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {
          {
            "buffers",
            mode = 4, -- buffer number and name
            buffers_color = {
              active = { gui = "bold", bg = "#181825", fg = mocha.rosewater }, -- copy bg color from :hi lualine_c_inactive
              inactive = "lualine_c_inactive",
            },
          },
        },
        lualine_b = {
          -- "branch"
        },
        lualine_c = {
          {
            -- "filename",
            -- file_status = true, -- displays file status (readonly status, modified status)
            -- path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          -- {
          --   "diagnostics",
          --   sources = { "nvim_diagnostic" },
          --   symbols = { error = " ", warn = " ", info = " ", hint = " " },
          -- },
          -- "encoding",
          -- "filetype",
        },
        lualine_y = {
          -- "progress"
        },
        lualine_z = {
          -- "location"
        },
      },
      inactive_sections = {
        -- lualine_a = {},
        -- lualine_b = {},
        -- lualine_c = {
        --   {
        --     "filename",
        --     file_status = true, -- displays file status (readonly status, modified status)
        --     path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        --   },
        -- },
        -- lualine_x = { "location" },
        -- lualine_y = {},
        -- lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}
