---- config for specific filetypes

-- MDX
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.mdx" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  end,
})

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

-- Vimwiki
vim.treesitter.language.register("markdown", "vimwiki")
