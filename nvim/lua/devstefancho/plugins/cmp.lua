return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("devstefancho.cmp.setup")
  end,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()

        ls.config.set_config({
          history = true,
          updateevents = "TextChanged,TextChangedI",
        })

        local expand = function()
          ls.expand()
        end
        local jump_forward = function()
          ls.jump(1)
        end
        local jump_back = function()
          ls.jump(-1)
        end
        local change_choice = function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end

        vim.keymap.set({ "i" }, "<M-k>", expand, { silent = true })
        vim.keymap.set({ "i", "s" }, "<M-l>", jump_forward, { silent = true })
        vim.keymap.set({ "i", "s" }, "<M-h>", jump_back, { silent = true })
        vim.keymap.set({ "i", "s" }, "<M-e>", change_choice, { silent = true })
      end,
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  cond = require("devstefancho.plugins_status").plugins_status["cmp"],
}
