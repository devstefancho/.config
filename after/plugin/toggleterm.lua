local status, t = pcall(require, "toggleterm")
if not status then
	return
end

local keymap = vim.keymap.set

t.setup({
	open_mapping = [[<c-\>]],
	start_in_insert = true,
	direction = "float",
})

function _G.set_terminal_keymaps()
	keymap("t", "<ESC>", [[<C-\><C-n>]], { buffer = 0 })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Use Lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 5 })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>lg",
	"<cmd>lua _lazygit_toggle()<CR>",
	{ noremap = true, silent = true, desc = "Show [L]azy [G]it" }
)
