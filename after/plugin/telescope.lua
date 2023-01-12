local status, telescope = pcall(require, "telescope")
if not status then
	return
end
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

-- telescope-file-browser
local fb_actions = require("telescope").extensions.file_browser.actions
local fb_open = function()
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
	},
	extensions = {
		file_browser = {
			theme = "dropdown", -- ivy, cursor, dropdown (:h telescope에서 theme 참고)
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
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

vim.keymap.set("n", "<leader>pa", find_all_files, {}) -- Project All Files
vim.keymap.set("n", "<leader>pf", fb_open) -- File Browser Extension Open
vim.keymap.set("n", "<C-p>", builtin.git_files, {}) -- Git Files
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {}) -- Project Search
vim.keymap.set("n", "<leader>pb", builtin.buffers, {}) -- Buffer
vim.keymap.set("n", "<leader>ph", builtin.help_tags, {}) -- Help Tags
