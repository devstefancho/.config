return {
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        direction = "float",
      })

      local keymap = vim.keymap.set
      local Terminal = require("toggleterm.terminal").Terminal

      function _G.set_terminal_keymaps() end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      -- Use Lazygit
      function _Lazygit_toggle()
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 5 })
        lazygit:toggle()
      end

      keymap(
        "n",
        "<leader>z",
        "<cmd>lua _Lazygit_toggle()<CR>",
        { noremap = true, silent = true, desc = "Show [L]azy [G]it" }
      )

      function _Node_server_toggle()
        local opts = { buffer = 0 }
        local node_server = Terminal:new({
          hidden = true,
          count = 6,
          direction = "float",
          on_open = function(term)
            keymap("t", "<esc>", function()
              term:toggle()
            end, opts)
          end,
        })
        node_server:toggle()
      end

      vim.api.nvim_create_user_command("YarnDev", _Node_server_toggle, {})

      function _Ollama_toggle()
        -- ollama run $(ollama list | fzf | awk -F':' '{print $1}')
        local opts = { buffer = 0 }
        local ollama = Terminal:new({
          hidden = true,
          count = 8,
          direction = "float",
          cmd = "ollama run $(ollama list | fzf | awk -F':' '{print $1}')",
          on_open = function(term)
            keymap("t", "<esc>", function()
              term:toggle()
            end, opts)
          end,
        })
        ollama:toggle()
      end

      function _Jira_History()
        local opts = { buffer = 0 }
        local jira_history = Terminal:new({
          hidden = true,
          count = 7,
          direction = "float",
          on_open = function(term)
            keymap("t", "<esc>", function()
              term:toggle()
            end, opts)
            vim.fn.chansend(term.job_id, "jhistory\n")
          end,
        })
        jira_history:toggle()
      end

      vim.api.nvim_create_user_command("Ollama", _Ollama_toggle, {})
    end,

    cond = require("devstefancho.plugins_status").plugins_status["toggleterm"],
  },
}
