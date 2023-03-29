return {
  "neovim/nvim-lspconfig", -- LSP Configuratios
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("devstefancho.lspsaga.setup")
      require("devstefancho.lspsaga.maps")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }, -- LSP performant UI

  -- managing & installing lsp servers, linters & formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("devstefancho.nvim-lsp.mason").setup()
    end,
  }, -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
}
