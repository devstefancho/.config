vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- Test Purpose
vim.api.nvim_set_hl(0, "@devstefancho", { fg = "#000000", bg = "#51576d", bold = true })
vim.api.nvim_set_hl(0, "@devstefancho.foo", { fg = "#000000", bg = "#f2d5cf", bold = true })
vim.api.nvim_set_hl(0, "@devstefancho.bar", { fg = "#000000", bg = "#babbf1", bold = true })
vim.api.nvim_set_hl(0, "@devstefancho.baz", { fg = "#000000", bg = "#e5c890", bold = true })

vim.api.nvim_set_hl(0, "@test.import.import", { fg = "#f2d5cf", force = true })
vim.api.nvim_set_hl(0, "@test.component_name_line", { fg = "#f4b8e4" })
vim.api.nvim_set_hl(0, "@test.use_state", { fg = "#e5c890" })
vim.api.nvim_set_hl(0, "@test.function_handle_click", { fg = "#a6d189" })
vim.api.nvim_set_hl(0, "@test.return_statement", { fg = "#81c8be" })
-- vim.api.nvim_set_hl(0, "@", { fg = "#000000", fg = "#babbf1", })

vim.api.nvim_set_hl(0, "@lsp.type.function", {})
