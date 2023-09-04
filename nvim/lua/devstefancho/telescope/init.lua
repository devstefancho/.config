local M = {}

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local telescope = require("telescope")

function M.find_all_files()
  builtin.find_files({
    no_ignore = true,
    hidden = true,
    no_ignore_parent = true,
    find_command = { "rg", "--no-ignore", "--files" },
  })
end

function M.search_only_certain_files()
  builtin.find_files({
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input("Type: "),
    },
  })
end

local function telescope_buffer_dir()
  -- Information about "%:p:h" (:tab h %:p)
  return vim.fn.expand("%:p:h")
end

-- telescope-file-browser
function M.file_browser()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end

function M.curbuf()
  local opt = themes.get_dropdown({
    sorting_strategy = "ascending",
    winblend = 10,
    layout_config = {
      height = 0.8,
    },
  })
  builtin.current_buffer_fuzzy_find(opt)
end

function M.find_commands()
  local opts = themes.get_dropdown({
    winblend = 10,
    previewer = false,
    shorten_path = false,
    layout_config = {
      center = {
        height = 0.4,
        prompt_position = "top",
        width = 0.5,
      },
    },
  })
  builtin.commands(opts)
end

function M.find_git_files()
  builtin.git_files(themes.get_dropdown({
    previewer = false,
    layout_config = {
      center = {
        height = 0.6,
        width = 0.6,
      },
    },
  }))
end

function M.find_git_changes()
  builtin.git_status(themes.get_ivy({}))
end

function M.show_diagnostics_error()
  builtin.diagnostics({
    severity = "error",
  })
end

function M.find_by_live_grep()
  builtin.live_grep({
    -- default_text = "keymap",
  })
end

function M.find_oldfiles()
  local cwd = vim.fn.getcwd()
  -- In case of iCloud Drive, cwd_only not working
  if string.find(cwd, "CloudDocs") then
    builtin.oldfiles(themes.get_ivy({
      cwd_only = false,
    }))
  else
    builtin.oldfiles(themes.get_ivy({
      cwd_only = true,
    }))
  end
end

function M.find_buffers()
  builtin.buffers()
end

function M.find_help_tags()
  builtin.help_tags()
end

function M.find_keymaps()
  builtin.keymaps()
end

-- telescope-project
function M.find_project()
  telescope.extensions.project.project({})
end

-- nvim-tree
function M.start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode]({
    cwd = basedir,
  })
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

-- custom function for obsidian old files
function M.my_vault_oldfiles()
  local results = vim.tbl_filter(function(val)
    return string.find(val, "my%-vault.*%.md") -- "my-vault"과 ".md"를 포함하는 파일만 필터링
  end, vim.v.oldfiles)

  pickers
    .new(themes.get_dropdown({
      prompt_title = "My Vault Files",
      finder = finders.new_table({
        results = results,
        entry_maker = function(entry)
          local display_name = string.match(entry, "my%-vault/(.+)") -- 파일 경로에서 "my-vault/" 다음의 이름 추출
          return {
            value = entry, -- 항목의 값은 파일 경로
            display = display_name, -- 피커에 표시될 파일 이름
            ordinal = entry, -- 항목의 정렬 순서는 파일 경로를 기준
          }
        end,
      }),
      sorter = sorters.get_fzy_sorter(), -- Fzy 정렬 알고리즘을 사용하여 항목 정렬
      attach_mappings = function(_, map)
        map("i", "<CR>", actions.select_default + actions.center) -- Enter 키로 선택하면 파일 열기
        map("n", "<CR>", actions.select_default + actions.center)
        return true
      end,
    }))
    :find()
end

local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")
local action_state = require("telescope.actions.state")

function M.my_jira_commands()
  local jira_commands = {
    { name = "JIRA", command = "jira", description = "Jira" },
    {
      name = "JIRA_ISSUE",
      command = "jira issue list",
      description = "내가 보고 있는 이슈 리스트 확인하기",
    },
    -- { command = "jira issue list -w", description = "내가 보고 있는 이슈 리스트 확인하기" },
    -- { command = "jira issue view <ISSUE_KEY>", description = "특정 이슈 확인하기" },
    -- { command = 'jira issue move FMP-1 "In Progress"', description = "이슈 상태 이동하기" },
    -- { command = "jira sprint list -a$(jira me)", description = "스프린트에서 내 작업 찾기" },
    -- { command = "jira sprint list --state future", description = "다음 스프린트 작업 확인하기" },
    -- { command = "jira issue list --history", description = "내가 여태 열어본 issue history" },
    -- { command = 'jira issue list --history -a$(jira me) -t"Subtask-in-qa"', description = "QA 항목만 보기" },
  }

  local gen_jira_commands = function(opts)
    local displayer = entry_display.create({
      separator = "▏",
      items = {
        { width = 20 },
        { width = 30 },
        { remaining = true },
      },
    })

    local make_display = function(entry)
      return displayer({
        { entry.name, "TelescopeResultsIdentifier" },
        entry.command,
        entry.description,
      })
    end

    return function(entry)
      return make_entry.set_default_entry_mt({
        name = entry.name, -- required for display
        command = entry.command, -- required for display
        description = entry.description, -- required for display
        --
        value = entry.command,
        ordinal = entry.command,
        display = make_display,
      }, opts)
    end
  end

  pickers
    .new(themes.get_dropdown({
      prompt_title = "Jira Commands",
      finder = finders.new_table({
        results = jira_commands,
        entry_maker = gen_jira_commands({}),
      }),
      sorter = sorters.get_fzy_sorter(),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()

          -- Error handling
          if selection == nil then
            print("Nothing was selected!")
            return
          end

          -- Close Telescope window
          actions.close(prompt_bufnr)

          -- Execute the command in a toggleterm terminal
          vim.api.nvim_exec(
            string.format(
              [[
                :ToggleTerm direction=horizontal
                :terminal %s
              ]],
              selection.value
            ),
            true
          )
        end)

        map("i", "<CR>", actions.select_default + actions.center)
        map("n", "<CR>", actions.select_default + actions.center)
        return true
      end,
    }))
    :find()
end

function M.lsp_references()
  builtin.lsp_references(themes.get_ivy({
    show_line = false,
    initial_mode = "normal",
  }))
end

return M
