return {
  -- Syntax Highlighings
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
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
        "yaml",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = false,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
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
    },
    init = function() end,
  },
  "nvim-treesitter/playground",
}
