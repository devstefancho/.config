return {
  -- Auto Pair Completion
  { "windwp/nvim-autopairs", cond = require("devstefancho.plugins_status").plugins_status["auto-pairs"] },
  { "windwp/nvim-ts-autotag", cond = require("devstefancho.plugins_status").plugins_status["auto-pairs"] },
}
