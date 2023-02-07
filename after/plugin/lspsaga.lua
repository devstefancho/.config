local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

lspsaga.setup({
  symbol_in_winbar = {
    enable = false,
  },
  finder = {
    max_height = 0.5,
    keys = {
      jump_to = "p",
      edit = { "o", "<CR>" },
      vsplit = "<c-v>", -- same as telescope vsplit keymap
      split = { "i", "<c-x>" }, -- same as telescope split keymap
      tabe = { "t", "<c-t>" }, -- same as telescope split keymap
      quit = { "q", "<ESC>" },
      close_in_preview = "<ESC>",
    },
  },
})
