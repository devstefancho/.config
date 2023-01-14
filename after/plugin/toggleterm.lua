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
	local opts = { buffer = 0 }
	keymap("t", "<esc>", [[<C-\><C-n>]], opts)
	keymap("t", "jk", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
