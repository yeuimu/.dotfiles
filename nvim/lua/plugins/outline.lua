return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set(
      'n',
      '<leader>o',
      '<cmd>Outline<CR>',
      { desc = 'Toggle Outline' }
    )

    require('outline').setup({
      providers = {
        priority = { 'nvim-lsp', 'coc', 'markdown', 'norg' },
        -- Configuration for each provider (3rd party providers are supported)
        lsp = {
          -- Lsp client names to ignore
          blacklist_clients = {},
        },
        markdown = {
          -- List of supported ft's to use the markdown provider
          filetypes = { 'markdown' },
        },
      },
    })
  end,
}
