return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {},
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = { 'c', 'lua', 'vimdoc', 'org', 'markdown', 'norg' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-treesitter/playground',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
      })
    end,
  },
}
