local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local status_ok, custom = pcall(require, "devstefancho.custom")
if not status_ok then
  custom = {}
end

local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions
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
          ["l"] = actions.select_default,
        },
      },
    },
    project = {
      -- If base_dirs updated, remove ~/.local/share/nvim/telescope-projects.txt
      -- See: https://github.com/nvim-telescope/telescope-project.nvim/issues/53
      base_dirs = vim.tbl_extend("keep", {
        "~/iCloud/Documents",
      }, custom.telescope_project_base_dirs or {}),
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
telescope.load_extension("harpoon")
