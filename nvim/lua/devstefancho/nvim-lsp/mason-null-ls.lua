local M = {}

function M.setup()
  local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
  if not mason_null_ls_status then
    return
  end

  mason_null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
      "prettier", -- ts/js formatter
      "stylua", -- lua formatter
      "eslint_d", -- ts/js linter
      "black", -- python formatter
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
  })
end

return M
