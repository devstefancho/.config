local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local date = os.date

local function title_case(str)
  local uppercase_title = str:gsub("(%l)(%w*)", function(a, b)
    return string.upper(a) .. b
  end)
  return uppercase_title:gsub("%-", " ")
end

-- Function to get the current date in YYYY-MM-DD format
local current_date = function()
  return date("%Y-%m-%d")
end

-- Function to get file name without extension
local file_name = function()
  local path = vim.fn.expand("%:t:r")
  return path
end

local format_title = function()
  local name = file_name()
  name = name:gsub("-", " ")
  return title_case(name)
end

local format_desc = function()
  local name = file_name()
  return name:gsub("-", " ")
end

local category = function()
  local path = vim.fn.expand("%:p:h:t")
  return path
end

-- Create the snippet with function nodes
local frontmatter = s(
  {
    trig = "fmt",
    name = "Frontmatter",
    dscr = "Insert frontmatter for vimwiki files",
  },
  fmt(
    [[
---
published: false
id: {filename}
slug: {filename}
title: {format_title}
description: {format_desc}
tags: ["{category}"]
categories: ["{category}"]
createdDate: {date}
updatedDate: {date}
---

]],
    {
      filename = f(file_name),
      format_title = f(format_title),
      format_desc = f(format_desc),
      date = f(current_date),
      category = f(category),
    }
  )
)

-- Add the snippet to LuaSnip for markdown files (you can change the filetype if necessary)
ls.add_snippets("vimwiki", {
  frontmatter,
})

ls.add_snippets("markdown", {
  frontmatter,
})
