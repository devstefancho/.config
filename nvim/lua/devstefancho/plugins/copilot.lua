return {
  -- Copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = { xml = false, markdown = false }
      vim.keymap.set(
        "i",
        "<M-a>",
        'copilot#Accept("<CR>")',
        { desc = "copilot accept", expr = true, silent = true, replace_keycodes = false }
      )

      vim.cmd([[
        autocmd BufRead,BufNewFile */Leetcode/** lua vim.cmd("Copilot disable"); print('Copilot is disabled for leetcode')
      ]]) -- disable copilot for leetcode
    end,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       auto_refresh = true,
  --     })
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "copilot.lua", "nvim-cmp" },
  --   config = function()
  --     require("copilot_cmp").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
}
