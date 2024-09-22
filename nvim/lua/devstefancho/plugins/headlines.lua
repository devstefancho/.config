return {
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local headlines = require("headlines")
      headlines.setup({
        -- @see https://github.com/lukas-reineke/headlines.nvim/issues/53#issuecomment-2156224105
        vimwiki = vim.tbl_extend("force", { treesitter_language = "markdown" }, headlines.config.markdown),
      })
    end,
    ft = { "markdown" },
    cond = require("devstefancho.plugins_status").plugins_status["headlines"],
  },
}
