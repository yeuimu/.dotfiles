return {
  -- -- Theme
  -- Default theme
  {
    'shaunsingh/nord.nvim',
    priority = 50,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_italic = true
      vim.g.nord_bold = true
      vim.g.nord_enable_sidebar_background = true  
      require('nord').set()
    end
  },
  -- *.lua
  {
    "folke/tokyonight.nvim",
    ft = "lua",
    priority = 1000,
    opts = { style = "moon" },
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  -- *.norg
  {
    "rebelot/kanagawa.nvim",
    ft = "norg",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end
  }
}
