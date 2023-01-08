local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		show_close_icon = false,
		show_buffer_close_icons = false,
		color_icons = true,
	},
	highlights = {
		separator = {
			fg = "#073642",
			bg = "#002b36",
		},
		separator_selected = {
			fg = "#073642",
		},
		background = { -- inactive buffers
			fg = "#657b83", -- font color
			bg = "#002b36", -- background color
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
		},
		fill = {
			bg = "#073642", -- tab 외에 남은 영역 background
		},
	},
})

-- Tab Movement
vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>") -- go to next buffer
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>") -- go to prev buffer
