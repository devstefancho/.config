-- AutoCompletion (https://github.com/hrsh7th/nvim-cmp)
local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local source_names = {
  nvim_lsp = "(LSP)",
  emoji = "(Emoji)",
  path = "(Path)",
  calc = "(Calc)",
  cmp_tabnine = "(Tabnine)",
  vsnip = "(Snippet)",
  luasnip = "(Snippet)",
  buffer = "(Buffer)",
  tmux = "(TMUX)",
  copilot = "(Copilot)",
  treesitter = "(TreeSitter)",
}

local duplicates_default = 0
local duplicates = {
  buffer = 1,
  path = 1,
  nvim_lsp = 0,
  luasnip = 1,
}

cmp.setup({
  -- snippet은 자동완성에서 confirm에서 오류가 발생하지 않으려면 필요함
  -- Error: snippet engine is not configured (https://github.com/hrsh7th/nvim-cmp/issues/373)
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
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
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
      vim_item.kind = require("devstefancho.icons").kind[vim_item.kind]
      vim_item.dup = duplicates[entry.source.name] or duplicates_default
      return vim_item
    end,
  },
})

vim.cmd([[ set completeopt=menuone,noinsert,noselect ]])
