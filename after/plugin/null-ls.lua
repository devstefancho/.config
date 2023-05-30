-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    --  to disable file types use
    --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "lua",
        "graphql",
      },
    }), -- js/ts formatter
    formatting.stylua, -- lua formatter
    formatting.eslint_d, -- js/ts formatter
    -- [[ Example for specific path check for eslint ]]
    diagnostics.eslint_d.with({
      -- js/ts linter
      condition = function(utils)
        -- eslint priority order https://eslint.org/docs/latest/use/configure/configuration-files#configuration-file-formats
        local files = {
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          "package.json",
        }

        -- has_file : search nearest eslintrc file from the  current buffer file
        -- root_has_file : used to check if a specific file exists in the root directory of the project
        for _, file in ipairs(files) do
          if utils.has_file(file) then
            return true
          end
        end
      end,
    }),
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
