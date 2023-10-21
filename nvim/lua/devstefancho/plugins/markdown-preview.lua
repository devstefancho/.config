return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  cond = require("devstefancho.plugins_status").plugins_status["markdown-preview"],
}
