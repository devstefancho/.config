require("devstefancho.globals")
require("devstefancho.base")
require("devstefancho.highlights")
require("devstefancho.maps")
require("devstefancho.plugins")

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
