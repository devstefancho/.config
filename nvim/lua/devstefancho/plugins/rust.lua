return {
  "rust-lang/rust.vim",
  init = function()
    -- setup rust formatter {https://github.com/rust-lang/rust.vim#formatting-with-rustfmt}
    vim.g.rustfmt_autosave = 1
  end,
}
