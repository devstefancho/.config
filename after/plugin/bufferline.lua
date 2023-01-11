local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

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
vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>") -- go to next buffer
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>") -- go to prev buffer
