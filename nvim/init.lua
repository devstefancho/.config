vim.g.mapleader = " " -- mapping for leaderkey should be before the lazy setup

require("devstefancho.globals")
require("devstefancho.base")
require("devstefancho.highlights")
require("devstefancho.maps")
require("devstefancho.plugins")
require("devstefancho.diagnostics")
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

if vim.fn.has("gui_vimr") == 1 then
  -- set vimr cwd to ~/Vault
  vim.cmd("cd ~/Vault")

  function LastModified()
    -- Check if the global variable g:md_modify_disabled is set
    if vim.g.md_modify_disabled then
      return
    end

    -- Check if the current buffer is modified
    if vim.bo.modified then
      -- Save the current cursor position
      local save_cursor = vim.fn.getpos(".")

      -- Determine the range for the search and replace
      local n = math.min(10, vim.fn.line("$"))

      -- Update the "updated :" timestamp
      for i = 1, n do
        local line = vim.fn.getline(i)
        if line:match("^updatedDate:") then
          local updated_line = line:gsub("^updatedDate:.*", "updatedDate: " .. os.date("%Y-%m-%d"))
          vim.api.nvim_buf_set_lines(0, i - 1, i, false, { updated_line })
          print("updatedDate updated!")
          break
        end
      end

      -- Restore the cursor position
      vim.fn.setpos(".", save_cursor)
    end
  end

  vim.api.nvim_command("autocmd BufWritePre *.md lua LastModified()")
end
