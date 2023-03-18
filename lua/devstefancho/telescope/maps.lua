local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local keymap = vim.keymap.set
local t = require("devstefancho.telescope")

-- Files
keymap("n", "<leader>fo", t.find_oldfiles, { desc = "[F]ind [O]ld-files" })
keymap("n", "<leader>fa", t.find_all_files, { desc = "[f]ind [a]ll files" })
keymap("n", "<leader>fb", t.find_buffers, { desc = "[F]ind [B]uffers" })
keymap("n", "<leader>fe", t.file_browser, { desc = "[F]ile [E]xplorer (browser)" })
keymap("n", "<leader>fw", t.find_by_live_grep, { desc = "[f]ind [w]ord by grep" })
keymap("n", "<leader>fd", t.find_git_files, { desc = "[f]ind in git [d]irectories" })
keymap("n", "<C-p>", t.find_git_changes, { desc = "Search By Git Changes" })
keymap("n", "<leader>fz", t.search_only_certain_files, { desc = "Search Certain Files" })
keymap("n", "<leader>ff", t.curbuf, { desc = "[f]ind in current buffer [f]ile" })

-- Helper
keymap("n", "<leader>f?", t.find_help_tags, { desc = "[f]ind help [?]" })
keymap("n", "<leader>fk", t.find_keymaps, { desc = "[F]ind [K]eymaps" })
keymap("n", "<leader>fm", t.find_commands, { desc = "[f]ind co[m]mands" })

-- Diagnostics
keymap("n", "<leader>dl", t.show_diagnostics_error, { desc = "[d]iagnostic [l]ist" })
