vim.g.mapleader = " " -- mapping for leaderkey should be before the lazy setup

require("devstefancho.globals")
require("devstefancho.base")
require("devstefancho.highlights")
require("devstefancho.maps")
require("devstefancho.plugins")
require("devstefancho.commands")

-- Copy to Clipboard
local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
  require("devstefancho.macos")
end
if is_win then
  require("devstefancho.windows")
end

-- [[ Lazy nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("devstefancho.plugins")
