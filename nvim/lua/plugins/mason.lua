return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  lazy = false,
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'pyright',
        'lua_ls',
      },
      automatic_installation = true,
    })
    require('lspconfig').lua_ls.setup({})
    require('lspconfig').pyright.setup({})
  end,
}
