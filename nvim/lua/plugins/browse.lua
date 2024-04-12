return {
  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
    },
  },
  -- tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>t', '<cmd>NvimTreeToggle<cr>', desc = 'Open File Tree Toggle' },
    },
    opts = {},
  }
}
