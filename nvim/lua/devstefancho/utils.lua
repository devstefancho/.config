local M = {}

-- [[ Keymaps ]]
function M.createKeymap(prefix)
  return function(lhs, rhs, desc, opts)
    prefix = prefix or "Unnamed"
    desc = desc and string.format("[%s] %s", prefix, desc) or ""

    opts = vim.tbl_extend("keep", opts or {}, { silent = true, desc = desc })

    vim.keymap.set("n", lhs, rhs, opts)
  end
end

return M
