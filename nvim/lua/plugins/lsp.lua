return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = function()
        require('mason').setup()
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        ensure_installed = {
          'lua_ls',
        },
        automatic_installation = true,
      },
      config = function(_, opts)
        require('mason-lspconfig').setup(opts)
      end,
    },
  },
  config = function()
    require('lspconfig').lua_ls.setup({
      capabilities = require('configs.lspconfig').capabilities,
      on_attach = require('configs.lspconfig').on_attach,
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

    --    require('lspconfig').rust_analyzer.setup({
    --      capabilities = capabilities,
    --      on_attach = on_attach,
    --      settings = {
    --        -- rust-analyzer language server configuration
    --        ["rust-analyzer"] = {
    --          cargo = {
    --            allFeatures = true,
    --            loadOutDirsFromCheck = true,
    --            runBuildScripts = true,
    --          },
    --          -- Add clippy lints for Rust.
    --          checkOnSave = {
    --            allFeatures = true,
    --            command = "clippy",
    --            extraArgs = { "--no-deps" },
    --          },
    --          procMacro = {
    --            enable = true,
    --            ignored = {
    --              ["async-trait"] = { "async_trait" },
    --              ["napi-derive"] = { "napi" },
    --              ["async-recursion"] = { "async_recursion" },
    --            },
    --          },
    --        },
    --      }
    --    })
  end,
}
