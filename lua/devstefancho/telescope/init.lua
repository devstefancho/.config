local M = {}

local keymap = vim.keymap.set
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local telescope = require("telescope")

function M.find_all_files()
  builtin.find_files({
    no_ignore = true,
    hidden = true,
    no_ignore_parent = true,
    find_command = { "rg", "--no-ignore", "--files" },
  })
end

function M.search_only_certain_files()
  builtin.find_files({
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input("Type: "),
    },
  })
end

local function telescope_buffer_dir()
  -- Information about "%:p:h" (:tab h %:p)
  return vim.fn.expand("%:p:h")
end

-- telescope-file-browser
function M.file_browser()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end

function M.curbuf()
  local opt = themes.get_dropdown({
    sorting_strategy = "ascending",
    winblend = 10,
    layout_config = {
      height = 0.8,
    },
  })
  builtin.current_buffer_fuzzy_find(opt)
end

function M.find_commands()
  local opts = themes.get_dropdown({
    winblend = 10,
    previewer = false,
    shorten_path = false,
    layout_config = {
      center = {
        height = 0.4,
        prompt_position = "top",
        width = 0.5,
      },
    },
  })
  builtin.commands(opts)
end

function M.find_git_files()
  builtin.git_files(themes.get_dropdown({
    previewer = false,
    layout_config = {
      center = {
        height = 0.6,
        width = 0.6,
      },
    },
  }))
end

function M.find_git_changes()
  builtin.git_status(themes.get_dropdown({
    previewer = false,
    layout_config = {
      center = {
        height = 0.6,
        width = 0.6,
      },
    },
  }))
end

function M.show_diagnostics_error()
  builtin.diagnostics({
    severity = "error",
  })
end

function M.find_by_live_grep()
  builtin.live_grep({
    -- default_text = "keymap",
  })
end

function M.find_oldfiles()
  builtin.oldfiles(themes.get_dropdown({
    only_cwd = true,
    previewer = false,
    layout_config = {
      center = {
        height = 0.6,
        width = 0.6,
      },
    },
  }))
end

function M.find_buffers()
  builtin.buffers()
end

function M.find_help_tags()
  builtin.help_tags()
end

function M.find_keymaps()
  builtin.keymaps()
end

-- telescope-project
function M.find_project()
  telescope.extensions.project.project({})
end

-- nvim-tree
function M.start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode]({
    cwd = basedir,
  })
end

return M
