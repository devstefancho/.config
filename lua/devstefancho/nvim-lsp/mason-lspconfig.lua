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
      "tsserver",
      "graphql",
      "cssls",
      "tailwindcss",
      "jsonls",
      "yamlls",
      "cssls",
      "html",
      "lua_ls",
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
      require("typescript").setup({
        disable_commands = false,
        debug = false,
        server = {
          on_attach = f.tsserver_on_attach,
          capabilities = capabilities,
          handlers = f.tsserver_handlers,
          filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
          cmd = { "typescript-language-server", "--stdio" },
        },
      })
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = f.lua_on_attach,
        settings = servers.lua_ls,
      })
    end,
  })
end

return M
