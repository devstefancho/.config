-- customize winbar
return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
    -- default configuration {https://github.com/utilyre/barbecue.nvim#-configuration}
    show_dirname = false,
  },
}
