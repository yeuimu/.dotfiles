local M = {}

M.mason = {
  'williamboman/mason-lspconfig.nvim',
  ft = {},
  priotiry = 100,
  dependencies = {
    'williamboman/mason.nvim',
    config = true
  },
  opts = {
    ensure_installed = {
    },
    automatic_installation = true,
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)
  end,
}

M.lsp = {
  'neovim/nvim-lspconfig',
  ft = {},
  priotiry = 99,
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
}

M.cmp = {
  'hrsh7th/nvim-cmp',
  ft = {},
  priotiry = 98,
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
  },
  opts = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    }
  end,
  config = function(_, opts)
    require('cmp').setup(opts)
  end,
}

M.treesitter = {
  'nvim-treesitter/nvim-treesitter',
  ft = {},
  priotiry = 97,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {},
    sync_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}

M.coform = {
  'stevearc/conform.nvim',
  ft = {},
  priotiry = 96,
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  opts = {
    formatters_by_ft = {},
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}

M.outline = {
  'hedyhli/outline.nvim',
  ft = {},
  dependencies = {
    'neovim/nvim-lspconfig'
  },
  keys = require('keymaps').outline,
  config = true,
}

return M
