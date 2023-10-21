return {
  {
    "heavenshell/vim-jsdoc",
    ft = "javascript,typescript,typescriptreact",
    cmd = "JsDoc",
    build = "make install",
    cond = require("devstefancho.plugins_status").plugins_status["jsdoc"],
  },
}
