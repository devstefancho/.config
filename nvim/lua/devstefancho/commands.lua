-- All custom commands before making plugin

vim.cmd([[
command! MyVaultOldFiles lua require('devstefancho.telescope').my_vault_oldfiles()
]])

vim.cmd([[
command! MyJiraCommands lua require('devstefancho.telescope').my_jira_commands()
]])

vim.cmd([[
command! GitworktreeCreate lua require('telescope').extensions.git_worktree.create_git_worktree() 
]])

-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
vim.cmd([[
command! GitworktreeSwitch lua require('telescope').extensions.git_worktree.git_worktrees()
]])

-- Auto Commands for Fold
-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
--   pattern = { "*.*" },
--   desc = "save view (folds), when closing file",
--   command = "mkview",
-- })
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = { "*.*" },
--   desc = "load view (folds), when opening file",
--   command = "silent! loadview",
-- })

-- Vimwiki
local vimwiki = require("devstefancho.vimwiki")
if vimwiki.is_current_path_wiki() then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.md",
    callback = function()
      vimwiki.last_modified_date()
    end,
  })

  vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
    pattern = "*.md",
    callback = function()
      -- @note use fmt:daily snippet instead
      -- vimwiki.insert_template()
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "vimwiki",
    callback = function()
      vim.cmd([[setlocal colorcolumn=100]])
    end,
  })
end
