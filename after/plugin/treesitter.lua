local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- How to Setup (https://github.com/nvim-treesitter/nvim-treesitter#modules)
ts.setup({
  ensure_installed = {
    "lua",
    "tsx",
    "json",
    "css",
    "javascript",
    "typescript",
    "help",
    "vim",
    "markdown",
    "markdown_inline",
    "html",
    "graphql",
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  context_commentstring = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "grm",
    },
  },
})
