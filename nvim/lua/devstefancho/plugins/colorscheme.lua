return {
  -- Color Theme
  -- use({ "svrana/neosolarized.nvim", dependencies = { "tjdevries/colorbuddy.nvim" } })
  -- use("marko-cerovac/material.nvim")
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
    priority = 1000,
    -- cond = false,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
    priority = 1000,
    cond = false,
  },

  -- Colorizer for color code
  "norcalli/nvim-colorizer.lua",

  -- indent marker
  "lukas-reineke/indent-blankline.nvim",
}
