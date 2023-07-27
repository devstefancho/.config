local M = {}

-- [[ Keymaps ]]
-- @params prefix: string start with capital letter
-- @return function: A function that takes 4 arguments
--                   lhs (string): left hand side
--                   rhs (string): right hand side
--                   desc (string, optional): description
--                   opts (table, optional): options
function M.createKeymap(prefix)
  return function(lhs, rhs, desc, opts)
    prefix = prefix or "Unnamed"
    desc = desc and string.format("[%s] %s", prefix, desc) or ""

    opts = vim.tbl_extend("keep", opts or {}, { silent = true, desc = desc })

    vim.keymap.set("n", lhs, rhs, opts)
  end
end

return M
