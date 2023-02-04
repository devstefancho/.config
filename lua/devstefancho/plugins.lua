-- Packer (https://github.com/wbthomason/packer.nvim)
local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Color Theme
  -- use({ "svrana/neosolarized.nvim", requires = { "tjdevries/colorbuddy.nvim" } })
  -- use("marko-cerovac/material.nvim")
  use("folke/tokyonight.nvim")

  -- Statusline
  use("nvim-lualine/lualine.nvim")

  -- LSP
  use("neovim/nvim-lspconfig") -- LSP Configuratios
  use({ "glepnir/lspsaga.nvim" }) -- LSP performant UI

  -- Auto Completion
  use("hrsh7th/cmp-buffer") -- Nvim-cmp source for buffer words
  use("hrsh7th/cmp-nvim-lsp") -- Nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/nvim-cmp") -- Completion
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }) -- Snippet

  -- Syntax Highlighings
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/playground")

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } })
  use("nvim-telescope/telescope-file-browser.nvim")

  -- File Icons
  use("nvim-tree/nvim-web-devicons")

  -- BufferLine
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  -- Colorizer for color code
  use("norcalli/nvim-colorizer.lua")

  -- managing & installing lsp servers, linters & formatters
  use({
    "williamboman/mason.nvim",
    config = function()
      require("devstefancho.nvim-lsp.mason").setup()
    end,
  }) -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- Code Formatting
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- Git
  use({
    "lewis6991/gitsigns.nvim", -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  })

  -- Comment
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  -- File Explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })
  use("vifm/vifm.vim")

  -- indent marker
  use("lukas-reineke/indent-blankline.nvim")

  -- Change Surrounding
  use("tpope/vim-surround")

  -- Codi
  use("metakirby5/codi.vim")

  -- Debugger
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("folke/neodev.nvim") -- this is only for nvim-dap-ui
  use("nvim-telescope/telescope-dap.nvim")
  use("theHamsta/nvim-dap-virtual-text")
  use("mxsdev/nvim-dap-vscode-js") -- need to debug javascript
  use({
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
  }) -- this is only for mxsdev/nvim-dap-vscode-js
end)
