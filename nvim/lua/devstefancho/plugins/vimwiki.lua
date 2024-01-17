return {
  "vimwiki/vimwiki",
  priority = 55,
  init = function()
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_use_calendar = 1
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_hl_cb_checked = 1
    vim.g.vimwiki_autowriteall = 0
    vim.g.vimwiki_listsym_rejected = "-"
    vim.g.vimwiki_listsyms = " .oOX"
    vim.g.vimwiki_conceallevel = 0

    vim.g.vimwiki_key_mappings = {
      all_maps = 1,
      global = 1,
      headers = 1,
      text_objs = 1,
      table_format = 1,
      table_mappings = 1,
      lists = 1,
      links = 1,
      html = 1,
      mouse = 0,
    }
    vim.g.vimwiki_list = {
      {
        path = "/Users/stefancho/Documents/work-wiki/",
        syntax = "markdown",
        ext = ".md",
        diary_rel_path = "daily/",
        diary_index = "__index",
        auto_diary_index = 1,
      },
      {
        path = "/Users/stefancho/Documents/open-wiki//",
        syntax = "markdown",
        ext = ".md",
        diary_rel_path = "daily/",
        diary_index = "__index",
        auto_diary_index = 1,
      },
    }
  end,
  config = function()
    local keymap = require("devstefancho.utils").createKeymap("Vimwiki")
    keymap("<leader>w,", "<Cmd>VimwikiDiaryPrevDay<CR>", "prev day diary")
    keymap("<leader>w.", "<Cmd>VimwikiDiaryNextDay<CR>", "next day diary")
    keymap("gl", "<Cmd>VimwikiRemoveCBInList<CR>", "remove checkbox in list")
  end,
  cond = require("devstefancho.plugins_status").plugins_status["vimwiki"],
}
