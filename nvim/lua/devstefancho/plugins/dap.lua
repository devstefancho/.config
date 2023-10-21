return {
  -- Debugger
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "folke/neodev.nvim", -- this is only for nvim-dap-ui
    "nvim-telescope/telescope-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js", -- need to debug javascript
    {
      "microsoft/vscode-js-debug",
      opt = true,
      build = "npm install --legacy-peer-deps && npm run compile",
    }, -- this is only for mxsdev/nvim-dap-vscode-js
  },
  cond = require("devstefancho.plugins_status").plugins_status["dap"],
}
