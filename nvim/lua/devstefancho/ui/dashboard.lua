local if_nil = vim.F.if_nil

local default_terminal = {
  type = "terminal",
  command = nil,
  width = 69,
  height = 8,
  opts = {
    redraw = true,
    window_config = {},
  },
}

local default_header = {
  type = "text",
  val = {
    [[         __               __       ____                  __            ]],
    [[    ____/ /__ _   _______/ /____  / __/____ _____  _____/ /_  ____     ]],
    [[   / __  / _ \ | / / ___/ __/ _ \/ /_ / __ `/ __ \/ ___/ __ \/ __ \    ]],
    [[  / /_/ /  __/ |/ (__  ) /_/  __/ __// /_/ / / / / /__/ / / / /_/ /    ]],
    [[  \__,_/\___/|___/____/\__/\___/_/   \__,_/_/ /_/\___/_/ /_/\____/     ]],
    [[                                                                       ]],
  },
  opts = {
    position = "center",
    hl = "Type",
    -- wrap = "overflow";
  },
}

local footer = {
  type = "text",
  val = "",
  opts = {
    position = "center",
    hl = "Number",
  },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 3,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("SPC fr", "󰊄  Recently opened files"),
    button("SPC ff", "󰈬  Find Word"),
    button("SPC fo", "󰈞  Find File"),
    button("SPC z", "  Lazy Git"),
    button("e", "  New file", "<cmd>ene <CR>"),
    button("q", "  Quit", "<cmd>q<CR>"),
    -- button("SPC f m", "  Jump to bookmarks"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  terminal = default_terminal,
  header = default_header,
  buttons = buttons,
  footer = footer,
}

local config = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

return {
  button = button,
  section = section,
  config = config,
  -- theme config
  leader = leader,
  -- deprecated
  opts = config,
}
