local M = {}

local config_status, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status then
  return
end

vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeFindFileToggle<CR>", { desc = "[Nvim-Tree] [f]ile [e]xplorer" })

local tree_cb = nvim_tree_config.nvim_tree_callback
local function telescope_find_files(_)
  require("devstefancho.telescope").start_telescope("find_files")
end

local function telescope_live_grep(_)
  require("devstefancho.telescope").start_telescope("live_grep")
end

M.custom_mappings = {
  { key = { "l", "<CR>" }, action = "edit", action_cb = tree_cb("edit") },
  { key = "o", action = "system_open", action_cb = tree_cb("system_open") },
  { key = "h", action = "close_node", action_cb = tree_cb("close_node") },
  { key = "s", action = "split", action_cb = tree_cb("split") },
  { key = "d", action = "cut", action_cb = tree_cb("cut") },
  { key = "D", action = "remove", action_cb = tree_cb("remove") },
  { key = "v", action = "vsplit", action_cb = tree_cb("vsplit") },
  { key = "<leader>fo", action = "telescope_find_files", action_cb = telescope_find_files }, -- override find_files
  { key = "<leader>ff", action = "telescope_live_grep", action_cb = telescope_live_grep }, -- override live_grep
}

return M
