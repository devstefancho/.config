-- print("Snippets are being loaded!")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require("luasnip.extras.fmt").fmt

local function kebabToPascalCase(str)
  local words = {}
  for word in str:gmatch("([^%-]+)") do
    table.insert(words, word)
  end

  for idx = 1, #words do
    words[idx] = words[idx]:sub(1, 1):upper() .. words[idx]:sub(2)
  end

  return table.concat(words)
end

local get_filename = function()
  return vim.fn.expand("%:t:r")
end

local component = s(
  "raf",
  fmt(
    [[
import {{ FC }} from 'react';

interface PropTypes {{}}

const {componentName}: FC<PropTypes> = () => {{
  {finishPosition}
  return (
    <div>
      {content}
    </div>
  );
}};

export default {componentName};
    ]],
    {
      componentName = f(function()
        local filename = get_filename()
        return kebabToPascalCase(filename)
      end),
      content = i(1, ""),
      finishPosition = i(0),
    }
  )
)

local use_state = s(
  "uses",
  fmt(
    [[
const [{1}, set{setter}] = useState<{3}>({2});
    ]],
    {
      i(1, "state"),
      i(2, "initialValue"),
      setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
      i(3, "T"),
    }
  )
)

local console_log = s(
  "clo",
  fmt(
    [[
console.log({{{}}});
    ]],
    {
      i(1),
    }
  )
)

ls.add_snippets("typescriptreact", {
  component,
  use_state,
  console_log,
})

ls.add_snippets("typescript", {
  console_log,
})
