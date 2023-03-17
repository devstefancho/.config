return {
  -- LSP
  "neovim/nvim-lspconfig", -- LSP Configuratios
  "glepnir/lspsaga.nvim", -- LSP performant UI

  -- managing & installing lsp servers, linters & formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("devstefancho.nvim-lsp.mason").setup()
    end,
  }, -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
}
