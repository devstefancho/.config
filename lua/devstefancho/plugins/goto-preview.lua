local keymap = require("devstefancho.utils").createKeymap("Lspsaga")

return {
  "rmagatti/goto-preview",
  config = function()
    local goto_preview = require("goto-preview")
    goto_preview.setup({})
    keymap("<leader>gd", goto_preview.goto_preview_definition)
    keymap("<leader>gt", goto_preview.goto_preview_type_definition)
    keymap("<leader>gi", goto_preview.goto_preview_implementation)
    keymap("<leader>gr", goto_preview.goto_preview_references)
    keymap("gP", goto_preview.close_all_win)
  end,
}
