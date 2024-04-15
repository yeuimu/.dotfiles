local mason = require('configs.comman').mason
table.insert(mason.ft, 'lua')
table.insert(mason.opts.ensure_installed, 'lua_ls')

local lsp = require('configs.comman').lsp
table.insert(lsp.ft, 'lua')
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'lua',
  once = true,
  callback = function()
    print('load lua lsp')
    require('lspconfig').lua_ls.setup({
      capabilities = require('configs.lsp').capabilities,
      on_attach = require('configs.lsp').on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      }
    })
  end
})

local cmp = require('configs.comman').cmp
table.insert(cmp.ft, 'lua')

local treesitter = require('configs.comman').treesitter
table.insert(treesitter.ft, 'lua')
table.insert(treesitter.opts.ensure_installed, 'lua')

local conform = require('configs.comman').coform
table.insert(conform.ft, 'lua')
local lua = 'lua_ls'
table.insert(conform.opts.formatters_by_ft, lua)

local outline = require('configs.comman').outline
table.insert(outline.ft, 'lua')

local neodev = {
  "folke/neodev.nvim",
  ft = 'lua',
  opts = {}
}

return {
  -- mason
  mason,
  -- lsp
  lsp,
  -- cmp
  cmp,
  -- treesitter
  treesitter,
  -- formatting
  conform,
  -- outline
  outline,
  -- beodev
  neodev,
}
