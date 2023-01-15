local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

local keymap = vim.keymap.set

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thin",
		show_close_icon = false,
		show_buffer_close_icons = false,
		color_icons = true,
	},
	-- fg is font-color, bg is background-color
	highlights = {
		separator = {},
		separator_selected = {},
		background = { -- inactive buffers
		},
		buffer_selected = {
			bold = true,
		},
		fill = {},
	},
})

-- Tab Movement
-- # Caution!! Do not use <Tab> for keymap, <Tab> is vim major key for jump motions (see :help jump-motions)
keymap("n", "<C-[>", "<Cmd>BufferLineCyclePrev<CR>") -- go to prev buffer
keymap("n", "<C-]>", "<Cmd>BufferLineCycleNext<CR>") -- go to next buffer
