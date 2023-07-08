local M = {}

function M.setup()
  local mason_status, mason = pcall(require, "mason")
  if not mason_status then
    return
  end

  -- enable mason
  mason.setup()
end

return M
