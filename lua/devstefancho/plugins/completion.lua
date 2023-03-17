return {
  -- Auto Completion
  "hrsh7th/cmp-buffer", -- Nvim-cmp source for buffer words
  "hrsh7th/cmp-nvim-lsp", -- Nvim-cmp source for neovim's built-in LSP
  "hrsh7th/nvim-cmp", -- Completion
  {
    "L3MON4D3/LuaSnip",
    version = "<CurrentMajor>.*",
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        auto_refresh = true,
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
}
