return {
  {
    'nvim-treesitter/nvim-treesitter',
    pin = true,
    ft = { 'lua, rust, norg' },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'lua', 'rust', 'norg' },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'stevearc/conform.nvim',
    pin = true,
    ft = { 'lua', 'rust' },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
