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

  -- Check if the local variable to disable update date
  local bufnr = vim.api.nvim_get_current_buf()
  local success, not_update_date = pcall(vim.api.nvim_buf_get_var, bufnr, "not_update_date")

  -- Check if the buffer-local variable not_update_date is set and true
  if success and not_update_date == 1 then
    print("Do Not Update Date")
    return
  end

  -- Check if the current buffer is modified
  if vim.bo.modified then
    -- Save the current cursor position
    local save_cursor = vim.fn.getpos(".")

    -- Determine the range for the search and replace
    local max_range_to_check_update_date = 20
    local n = math.min(max_range_to_check_update_date, vim.fn.line("$"))

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

local function work_wiki_daily_template(filename, current_date)
  return {
    "---",
    "id: " .. filename,
    "tags: private-daily",
    "createdDate: " .. current_date,
    "updatedDate: " .. current_date,
    "---",
    "",
    "# " .. filename,
    "",
    "- [ ]  ",
  }
end

function M.insert_template()
  local filepath = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t:r")
  local current_date = os.date("%Y-%m-%d")
  local is_empty_first_line = vim.fn.line("$") == 1 and vim.fn.getline(1) == ""
  local is_dir_private_daily = filepath:match("work%-wiki%/daily")
  local is_dir_public_daily = filepath:match("open%-wiki%/daily")

  if not is_empty_first_line then
    return
  end

  local template = {}
  if is_dir_public_daily then
    return -- use daily snippet
  elseif is_dir_private_daily then
    template = work_wiki_daily_template(filename, current_date)
  else
    return -- nothing do, you should frontmatter yourself (use frontmatter snippet)
  end

  vim.api.nvim_buf_set_lines(0, 0, 0, false, template)
  local lastline = vim.fn.line("$")
  vim.api.nvim_win_set_cursor(0, { lastline - 1, 6 }) -- move cursor to the end of the line
  vim.cmd("startinsert")
end

return M
