local fn = hs.loadSpoon("devstefancho")

fn.autoReload()
hs.keycodes.inputSourceChanged(fn.IM_alert)

-- [[ Launch App ]]
-- Application Example: Obsidian, CodeSandbox, iTerm, Visual Studio Code
fn.hotkeyBindApp({ "alt" }, "1", "Alacritty")
fn.hotkeyBindApp({ "alt" }, "2", "Google Chrome")

-- [[ Remapper ]]
local FRemap = hs.loadSpoon("foundation_remapping")

local remapper = FRemap.new()
remapper:remap("rcmd", "F19") -- 한/영 변환키
-- remapper:remap("capslock", "lctrl")
remapper:register()
