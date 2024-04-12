return {
  -- theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight')
    end,
  },
  -- headline
  {
    'lukas-reineke/headlines.nvim',
    ft = { 'markdown' },
    opts = {
      markdown = {
        bullets = { "◉", "○", "✸", "✿" },
        fat_headline_upper_string = " ",
        fat_headline_lower_string = " ",
      },
    },
  },
}
