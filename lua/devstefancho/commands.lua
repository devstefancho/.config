-- All custom commands before making plugin

vim.cmd([[
command! MyVaultOldFiles lua require('devstefancho.telescope').my_vault_oldfiles()
]])

vim.cmd([[
command! MyJiraCommands lua require('devstefancho.telescope').my_jira_commands()
]])
