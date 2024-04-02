return {
  'stevearc/conform.nvim',
  tf = 'lua',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      -- lsp_fallback = true,
    },
  },
}
