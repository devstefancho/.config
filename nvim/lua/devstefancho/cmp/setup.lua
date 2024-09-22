local cmp = require("cmp")

local source_names = {
  luasnip = "[snip]",
  copilot = "[Copilot]",
  nvim_lsp = "[lsp]",
  path = "[path]",
  buffer = "[buf]",
  ["vim-dadbod-completion"] = "[db]",
}

local duplicates_default = 0
-- 0: 중복 비허용, 1: 중복 허용
local duplicates = {
  buffer = 1,
  path = 1,
  nvim_lsp = 1,
  luasnip = 1,
}

-- See: https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
    ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
  }),
  sources = cmp.config.sources({
    { name = "luasnip", keyword_length = 3 },
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "vim-dadbod-completion", priority = 700 },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    max_width = 0,
    format = function(entry, vim_item)
      -- See :help complete-items
      vim_item.menu = source_names[entry.source.name]
      local kind = require("devstefancho.icons").kind[vim_item.kind] or vim_item.kind
      vim_item.kind = kind
      vim_item.dup = duplicates[entry.source.name] or duplicates_default
      return vim_item
    end,
  },
})

vim.cmd([[ set completeopt=menuone,noinsert,noselect ]])
