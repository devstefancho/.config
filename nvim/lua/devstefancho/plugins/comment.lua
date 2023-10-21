return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    cond = require("devstefancho.plugins_status").plugins_status["comment"],
  },
}
