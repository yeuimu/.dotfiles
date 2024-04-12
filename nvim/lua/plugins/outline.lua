return {
  'hedyhli/outline.nvim',
  keys = {
    { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle Outline' }
  },
  opts = {
    providers = {
      priority = { 'nvim-lsp', 'coc', 'markdown', 'norg' },
    },
  },
}
