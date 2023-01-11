local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- How to Setup (https://github.com/nvim-treesitter/nvim-treesitter#modules)
ts.setup({
	ensure_installed = {
		"lua",
		"tsx",
		"json",
		"css",
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
	},
})
