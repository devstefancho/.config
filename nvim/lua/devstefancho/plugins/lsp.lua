return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function()
        require("devstefancho.nvim-lsp.mason").setup()
        require("devstefancho.nvim-lsp.mason-lspconfig").setup()
      end,
    }, -- in charge of managing lsp servers, linters & formatters
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
  },
}
