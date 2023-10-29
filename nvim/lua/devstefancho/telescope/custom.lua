local M = {}

local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")

-- search text from open buffers
function M.search_open_buffers()
  local buffers = {}
  for _, buf in ipairs(vim.api.nvim_call_function("getbufinfo", { { buflisted = 1 } })) do
    table.insert(buffers, buf.name)
  end
  local input = { "rg", "--line-number", "--column", "--with-filename", "-U", "" }

  for _, filename in ipairs(buffers) do
    table.insert(input, vim.fn.expand(filename))
  end

  local job_opts = {
    entry_maker = function(entry)
      -- entry format is {path:line_number:column_number:matched_content}
      local _, _, path, lnum, col, text = string.find(entry, "(.+):(%d+):(%d+):(.*)")
      local filename = vim.fn.fnamemodify(path, ":t")
      local space = string.rep(" ", 15)
      local display = filename .. ":" .. lnum .. space .. text

      return {
        value = entry,
        ordinal = text,
        display = display,
        path = path,
        lnum = tonumber(lnum),
      }
    end,
  }

  local opts = {
    finder = finders.new_oneshot_job(input, job_opts),
    sorter = sorters.get_generic_fuzzy_sorter(),
    layout_strategy = "center",
    sorting_strategy = "ascending",
  }

  local picker = pickers.new(opts)
  picker:find()
end

return M
