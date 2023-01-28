local M = {}

local f = require("devstefancho.nvim-lsp.functions")
local servers = {
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = { checkThirdParty = false },
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
      "sumneko_lua",
      "tsserver",
      "graphql",
      "cssls",
      "tailwindcss",
      "jsonls",
      "yamlls",
      "cssls",
    },
  })

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = f.on_attach,
        settings = servers[server_name],
      })
    end,

    -- Override tsserver lsp config
    ["tsserver"] = function()
      lspconfig.tsserver.setup({
        filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = f.tsserver_on_attach,
        handlers = f.tsserver_handlers,
      })
    end,
    ["sumneko_lua"] = function()
      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        on_attach = f.lua_on_attach,
        settings = servers.sumneko_lua,
      })
    end,
  })
end

return M
