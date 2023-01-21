local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local keymap = vim.keymap.set
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Information about "%:p:h" (:tab h %:p)
local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local find_all_files = function()
  builtin.find_files({
    no_ignore = true,
    hidden = true,
    no_ignore_parent = true,
  })
end

local search_only_certain_files = function()
  require("telescope.builtin").find_files({
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

-- Setup
telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
    file_ignore_patterns = { "node_modules" },
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
  },
})

telescope.load_extension("file_browser")

-- Files
keymap("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld-files" })
keymap("n", "<leader>ff", find_all_files, { desc = "[F]ind [F]iles" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
keymap("n", "<leader>fe", file_browser, { desc = "[F]ile [E]xplorer (browser)" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
keymap("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
keymap("n", "<leader>fz", search_only_certain_files, { desc = "Search Certain Files" })

-- Helper
keymap("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
keymap("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })

-- Diagnostics
keymap("n", "<leader><leader>d", builtin.diagnostics, { desc = "[D]iagnostics" })
