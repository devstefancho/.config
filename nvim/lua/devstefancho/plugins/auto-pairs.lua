return {
  {
    "windwp/nvim-autopairs",
    cond = require("devstefancho.plugins_status").plugins_status.autopairs,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close_on_slash = false, -- slash bug {https://github.com/windwp/nvim-ts-autotag/issues/125}
    },
    cond = require("devstefancho.plugins_status").plugins_status.autotag,
  },
}
