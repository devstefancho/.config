local M = {}

function M.is_current_path_wiki()
  local current_path = vim.fn.getcwd()
  if string.find(current_path, "wiki") then
    return true
  end
  return false
end

function M.last_modified_date()
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

function M.insert_template()
  local filepath = vim.fn.expand("%:p")
  if filepath:match("daily") then
    if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      local current_date = os.date("%Y-%m-%d")
      local filename = vim.fn.expand("%:t:r")
      local template = {
        "---",
        "id: " .. filename, -- if use current_date then VimwikiMakeTommorowDiaryNote will use current_date, so use filename instead
        "tags: daily",
        "createdDate: " .. current_date,
        "updatedDate: " .. current_date,
        "---",
        "",
        "# " .. filename, -- if use current_date then VimwikiMakeTommorowDiaryNote will use current_date, so use filename instead
        "",
        "- [ ]  ",
      }
      vim.api.nvim_buf_set_lines(0, 0, 0, false, template)

      local lastline = vim.fn.line("$")
      vim.api.nvim_win_set_cursor(0, { lastline - 1, 6 }) -- move cursor to the end of the line
      vim.cmd("startinsert")
    end
    return
  end

  if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    local current_date = os.date("%Y-%m-%d")
    local filename = vim.fn.expand("%:t:r")
    local template = {
      "---",
      "id: " .. filename,
      "tags: " .. filename,
      "createdDate: " .. current_date,
      "updatedDate: " .. current_date,
      "---",
      "",
    }
    vim.api.nvim_buf_set_lines(0, 0, 0, false, template)
    vim.cmd("startinsert")
  end
end

return M
