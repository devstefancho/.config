local status, dap = pcall(require, "dap")
if not status then
  return
end

local dap_ui = require("dapui")

-- [[ this setup is get from lvim core dap.lua ]]
dap_ui.setup({
  icons = { expanded = "", collapsed = "", circular = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- [[ Use this to override mappings for specific elements ]]
  element_mappings = {},
  expand_lines = true,
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  },
})
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...,
})
require("nvim-dap-virtual-text").setup()
require("telescope").load_extension("dap")

local keymap = require("devstefancho.utils").createKeymap("Dap")

keymap("<leader><leader>db", dap.step_back, "step_back")
keymap("<leader><leader>di", dap.step_into, "step_into")
keymap("<leader><leader>do", dap.step_over, "step_over")
keymap("<leader><leader>du", dap.step_out, "step_out")
keymap("<leader><leader>dc", dap.continue, "continue")
keymap("<leader><leader>dd", dap.disconnect, "disconnect")
keymap("<leader><leader>dr", dap.repl.open)
keymap("<leader><leader>dt", dap.toggle_breakpoint)

-- See https://github.com/mxsdev/nvim-dap-vscode-js#installation
require("dap-vscode-js").setup({
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

-- [[ See :help dap-extensions ]]
dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
