local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local t = require("devstefancho.telescope")
local keymap = function(lhs, rhs, desc)
  if desc then
    desc = "[Telescope] " .. desc
  end

  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

-- Files
keymap("<leader>fo", t.find_oldfiles, "[f]ind [o]ld-files")
keymap("<leader>fa", t.find_all_files, "[f]ind [a]ll files")
keymap("<leader>fb", t.find_buffers, "[f]ind [b]uffers")
keymap("<leader>fe", t.file_browser, "[f]ile [e]xplorer (browser)")
keymap("<leader>fw", t.find_by_live_grep, "[f]ind [w]ord by grep")
keymap("<leader>fd", t.find_git_files, "[f]ind in git [d]irectories")
keymap("<C-p>", t.find_git_changes, "Find By Git Changes")
keymap("<leader>fz", t.search_only_certain_files, "[f]ind by certain types")
keymap("<leader>ff", t.curbuf, "[f]ind in current buffer [f]ile")

-- Helper
keymap("<leader>f?", t.find_help_tags, "[f]ind help [?]")
keymap("<leader>fk", t.find_keymaps, "[f]ind [k]eymaps")
keymap("<leader>fm", t.find_commands, "[f]ind co[m]mands")

-- Diagnostics
keymap("<leader>dl", t.show_diagnostics_error, "[d]iagnostic [l]ist")

-- Project
keymap("<leader>fp", t.find_project, "[f]ind [p]roject")
