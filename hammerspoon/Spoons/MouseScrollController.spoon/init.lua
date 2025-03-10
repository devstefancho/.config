local obj = {}

obj.__index = obj
obj.name = "MouseScrollController"
obj.version = "1.0"

-- higher speedFactor values result in faster scrolling
local speedFactor = 30

function obj:handleScrollEvent(event)
  -- mouse scroll event
  local scrollWheelEvent = event:getProperty(hs.eventtap.event.properties.scrollWheelEventIsContinuous)

  -- scrollWheelEvent 0 : mouse
  -- scrollWheelEvent 1 : trackpad
  if scrollWheelEvent == 0 then
    -- invert X, Y axis
    local scroll = event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1)
    local horizontalScroll = event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis2)

    -- 새로운 이벤트를 생성해 방향을 반전시켜 전달
    local invertedEvent = hs.eventtap.event.newScrollEvent(
      { -horizontalScroll * speedFactor, -scroll * speedFactor },
      {},
      "pixel"
    )

    -- ignore default behavior and return inverted value
    return true, { invertedEvent }
  end
end

function obj:start()
  local eventTypes = hs.eventtap.event.types

  self.mouseScrollWatcher = hs.eventtap.new({ eventTypes.scrollWheel }, function(event)
    return self:handleScrollEvent(event)
  end)

  self.mouseScrollWatcher:start()
end

return obj
