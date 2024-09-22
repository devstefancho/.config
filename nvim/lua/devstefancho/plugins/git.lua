local keymap = require("devstefancho.utils").createKeymap("GitSigns")

return {
  {
    "lewis6991/gitsigns.nvim", -- tag = 'release' -- To use the latest release (do not use this if you build Neovim nightly or dev builds!)
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          -- Navigation
          keymap("]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          keymap("[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          keymap("<leader>ghs", ":Gitsigns stage_hunk<CR>", "[h]unk [s]taged of current line")
          keymap("<leader>ghr", ":Gitsigns reset_hunk<CR>", "[h]unk [r]eset")
          keymap("<leader>ghS", gs.stage_buffer, "all [h]unks in buffer [S]taged")
          keymap("<leader>ghu", gs.undo_stage_hunk, "last [h]unk [u]ndo stage")
          keymap("<leader>ghR", gs.reset_buffer, "all [h]unks in buffer [R]eset")
          keymap("<leader>ghp", gs.preview_hunk, "[h]unk [p]review")
          keymap("<leader>ghb", function()
            gs.blame_line({ full = true })
          end, "[h]unk [b]lame line")
          keymap("<leader>ghd", gs.diffthis, "[h]unk [d]iff this")
        end,
      })
    end,
    cond = require("devstefancho.plugins_status").plugins_status.gitsigns,
  },
  -- Worktree
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup({
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
      })
      require("telescope").load_extension("git_worktree")

      local Worktree = require("git-worktree")

      -- op = Operations.Switch, Operations.Create, Operations.Delete
      -- metadata = table of useful values (structure dependent on op)
      --      Switch
      --          path = path you switched to
      --          prev_path = previous worktree path
      --      Create
      --          path = path where worktree created
      --          branch = branch name
      --          upstream = upstream remote name
      --      Delete
      --          path = path where worktree deleted

      Worktree.on_tree_change(function(op, metadata)
        if op == Worktree.Operations.Switch then
          print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
          -- os.execute("yarn") -- example for running yarn in new worktree
        end
      end)
    end,
    cond = require("devstefancho.plugins_status").plugins_status["git-worktree"],
  },
}
