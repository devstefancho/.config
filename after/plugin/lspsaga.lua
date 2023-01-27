local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

lspsaga.setup({
  symbol_in_winbar = {
    enable = false,
  },
})
