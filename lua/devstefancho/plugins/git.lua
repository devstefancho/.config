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
          delay = 100,
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
          end, "go to next hunk")

          keymap("[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, "go to prev hunk")

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
  },
}
