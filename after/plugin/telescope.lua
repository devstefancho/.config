local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local keymap = vim.keymap.set
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- Information about "%:p:h" (:tab h %:p)
local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local find_all_files = function()
  builtin.find_files({
    no_ignore = true,
    hidden = true,
    no_ignore_parent = true,
    find_command = { "rg", "--no-ignore", "--files" },
  })
end

local search_only_certain_files = function()
  builtin.find_files({
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input("Type: "),
    },
  })
end

-- telescope-file-browser
local fb_actions = require("telescope").extensions.file_browser.actions
local file_browser = function()
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

local curbuf = function()
  local opt = themes.get_dropdown({
    sorting_strategy = "ascending",
    winblend = 10,
    layout_config = {
      height = 0.8,
    },
  })
  builtin.current_buffer_fuzzy_find(opt)
end

local find_commands = function()
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

local find_git_files = function()
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

local find_git_changes = function()
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

local show_diagnostics_error = function()
  require("telescope.builtin").diagnostics({
    severity = "error",
  })
end

local find_by_live_grep = function()
  builtin.live_grep({
    -- default_text = "keymap",
  })
end

local function find_oldfiles()
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

-- Setup
telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = { "node_modules", ".worktree" },
  },
  extensions = {
    file_browser = {
      theme = "dropdown", -- ivy, cursor, dropdown (:h telescope에서 theme 참고)
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {},
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
        },
      },
    },
    project = {
      base_dirs = {
        { path = "~/works/" },
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "recent",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("project")

-- Files
keymap("n", "<leader>fo", find_oldfiles, { desc = "[F]ind [O]ld-files" })
keymap("n", "<leader>fa", find_all_files, { desc = "[f]ind [a]ll files" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
keymap("n", "<leader>fe", file_browser, { desc = "[F]ile [E]xplorer (browser)" })
keymap("n", "<leader>fw", find_by_live_grep, { desc = "[f]ind [w]ord by grep" })
keymap("n", "<leader>fd", find_git_files, { desc = "[f]ind in git [d]irectories" })
keymap("n", "<C-p>", find_git_changes, { desc = "Search By Git Changes" })
keymap("n", "<leader>fz", search_only_certain_files, { desc = "Search Certain Files" })
keymap("n", "<leader>ff", curbuf, { desc = "[f]ind in current buffer [f]ile" })

-- Helper
keymap("n", "<leader>f?", builtin.help_tags, { desc = "[f]ind help [?]" })
keymap("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
keymap("n", "<leader>fm", find_commands, { desc = "[f]ind co[m]mands" })

-- Diagnostics
keymap("n", "<leader>dl", show_diagnostics_error, { desc = "[d]iagnostic [l]ist" })
