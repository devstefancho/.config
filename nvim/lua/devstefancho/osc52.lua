-- In ssh remote connection, copy text in remote system to local system clipboard
-- https://github.com/tmux/tmux/wiki/Clipboard
-- :h clipboard-osc52

local osc52 = require("vim.ui.clipboard.osc52")
vim.g.clipboard = {
  name = "OSC-52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = osc52.paste("+"),
    ["*"] = osc52.paste("*"),
  },
}

local silent_noremap = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>y", '"+y', silent_noremap)
vim.keymap.set("v", "<leader>y", '"+y', silent_noremap)

vim.keymap.set("n", "<leader>d", '"+d', silent_noremap)
vim.keymap.set("v", "<leader>d", '"+d', silent_noremap)
vim.keymap.set("n", "<leader>D", '"+D', silent_noremap)

vim.keymap.set("n", "<leader>p", '"+p', silent_noremap)
