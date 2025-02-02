local M = {}

function M.hotkeyBindApp(modifier, char, application)
  hs.hotkey.bind(modifier, char, function()
    hs.application.launchOrFocus(application)
  end)
end

function M.autoReload()
  local function reloadConfig(files)
    local doReload = false
    for _, file in pairs(files) do
      if file:sub(-4) == ".lua" then
        doReload = true
      end
    end
    if doReload then
      hs.reload()
    end
  end
  myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
  hs.alert.show("Config loaded")
end

-- [[ Alert when keyboard input language changed ]]
local last_alerted_IM_ID
local last_IM_alert_uuid
function M.IM_alert()
  local currentIMID = hs.keycodes.currentSourceID()
  -- End the alert function if the alert is the same as the previous one
  if currentIMID == last_alerted_IM_ID then
    return
  end

  -- Close the previous alert about IM changing
  if last_IM_alert_uuid then
    hs.alert.closeSpecific(last_IM_alert_uuid)
  end

  -- Current input source name
  local inputSourceName
  if currentIMID == "com.apple.keylayout.ABC" then
    inputSourceName = "Eng"
  else
    inputSourceName = "한글"
  end

  last_IM_alert_uuid = hs.alert.show(inputSourceName, 1)
  last_alerted_IM_ID = hs.keycodes.currentSourceID()
end

-- Function to resize and center the focused window
function M.resizeAndCenterWindow(size)
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local screen = win:screen()
  local max = screen:frame()

  local newWidth = max.w * size
  local newHeight = max.h * size
  local newX = max.x + (max.w - newWidth) / 2
  local newY = max.y + (max.h - newHeight) / 2

  win:setFrame(hs.geometry.rect(newX, newY, newWidth, newHeight))
end

-- Bind the resize and center function to alt + shift + enter
hs.hotkey.bind({ "alt", "shift" }, "j", function()
  M.resizeAndCenterWindow(0.8)
end)

hs.hotkey.bind({ "alt", "shift" }, "return", function()
  M.resizeAndCenterWindow(1.0)
end)

return M
