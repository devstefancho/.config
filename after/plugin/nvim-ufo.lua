local status, ufo = pcall(require, "ufo")
if not status then
  return
end

local keymap = vim.keymap.set

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap("n", "zR", ufo.openAllFolds, { desc = "open all folds" })
keymap("n", "zM", ufo.closeAllFolds, { desc = "close all folds" })
