local M = {}

local f = require("devstefancho.nvim-lsp.functions")

local servers = {
  lua_ls = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "hs" }, -- hs for hammerspoon
      },
      telemetry = { enable = false },
    },
  },
}

function M.setup()
  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  local status, lspconfig = pcall(require, "lspconfig")
  if not status then
    return
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  mason_lspconfig.setup({
    ensure_installed = {
      "vimls",
      "ts_ls",
      "cssls",
      "tailwindcss",
      "jsonls",
      "yamlls",
      "cssls",
      "html",
      "lua_ls",
      "cssmodules_ls",
      "bashls",
      "rust_analyzer",
      "marksman",
      "astro", -- install astro lsp with npm install -g @astrojs/language-server (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro)
      "svelte",
      "pyright",
      "eslint",
      "terraformls",
    },
  })
  local init_options = {
    cssmodules_ls = {
      camelCase = false,
    },
  }

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = f.on_attach,
        settings = servers[server_name],
        init_options = init_options[server_name],
      })
    end,

    -- Override tsserver lsp config
    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        on_attach = f.on_attach,
        capabilities = capabilities,
        handlers = f.ts_ls_handlers,
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
      })
    end,
  })
end

return M
