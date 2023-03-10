return {
  -- Color Theme
  -- use({ "svrana/neosolarized.nvim", dependencies = { "tjdevries/colorbuddy.nvim" } })
  -- use("marko-cerovac/material.nvim")
  "folke/tokyonight.nvim",

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- LSP
  "neovim/nvim-lspconfig", -- LSP Configuratios
  "glepnir/lspsaga.nvim", -- LSP performant UI

  -- Auto Completion
  "hrsh7th/cmp-buffer", -- Nvim-cmp source for buffer words
  "hrsh7th/cmp-nvim-lsp", -- Nvim-cmp source for neovim's built-in LSP
  "hrsh7th/nvim-cmp", -- Completion
  {
    "L3MON4D3/LuaSnip",
    version = "<CurrentMajor>.*",
  },

  -- Syntax Highlighings
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },
  "nvim-treesitter/playground",

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { { "nvim-lua/plenary.nvim" } } },
  "nvim-telescope/telescope-file-browser.nvim",

  -- File Icons
  "nvim-tree/nvim-web-devicons",

  -- BufferLine
  { "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Colorizer for color code
  "norcalli/nvim-colorizer.lua",

  -- managing & installing lsp servers, linters & formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("devstefancho.nvim-lsp.mason").setup()
    end,
  }, -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- Code Formatting
  "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  -- Git
  {
    "lewis6991/gitsigns.nvim", -- tag = 'release' -- To use the latest release (do not use this if you build Neovim nightly or dev builds!)
  },

  -- Comment
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  "vifm/vifm.vim",

  -- indent marker
  "lukas-reineke/indent-blankline.nvim",

  -- Change Surrounding
  "tpope/vim-surround",

  -- Codi
  "metakirby5/codi.vim",

  -- Debugger
  "mfussenegger/nvim-dap",
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

  -- Emmet
  "mattn/emmet-vim",

  -- Zenmode
  "Pocco81/true-zen.nvim",

  -- Pretty Fold
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
}
