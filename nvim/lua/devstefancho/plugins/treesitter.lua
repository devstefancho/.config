return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "tsx",
        "json",
        "css",
        "javascript",
        "typescript",
        "vim",
        "markdown",
        "markdown_inline",
        "html",
        "graphql",
        "yaml",
        "rust",
        "svelte",
        "diff",
        "gitcommit",
        "styled",
        "terraform",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = false,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown", "gitcommit" },
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          -- init_selection = "<c-space>",
          -- node_incremental = "<c-space>",
          -- scope_incremental = "<c-s>",
          -- node_decremental = "grm",
        },
      },
      -- reference from {https://github.com/omerxx/dotfiles/blob/master/nvim/lua/plugins/treesitter.lua}
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            -- ["aa"] = "@parameter.outer",
            -- ["ia"] = "@parameter.inner",
            -- ["ii"] = "@conditional.inner",
            -- ["ai"] = "@conditional.outer",
            -- ["il"] = "@loop.inner",
            -- ["al"] = "@loop.outer",
            -- ["ac"] = "@class.outer",
            -- ["ic"] = "@class.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["it"] = "@comment.inner",
            ["at"] = "@comment.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]]"] = "@function.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
          },
        },
      },
    })
    require("treesitter-context").setup({
      enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
    })
  end,
  init = function() end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  cond = require("devstefancho.plugins_status").plugins_status["treesitter"],
}
