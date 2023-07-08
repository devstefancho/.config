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
        -- disable = {},
        disable = { "markdown", "markdown_inline" },
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
    init = function()
      -- HACK: seems to be a bug at the moment
      -- Similar issue to https://www.reddit.com/r/neovim/comments/ymtk2i/treesitter_highlighting_does_not_work/
      local group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        group = group,
        pattern = "*",
        callback = function()
          vim.cmd(":TSEnable highlight")
        end,
      })
    end,
  },
  "nvim-treesitter/playground",
}
