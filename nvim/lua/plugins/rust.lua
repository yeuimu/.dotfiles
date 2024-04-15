local mason = require('configs.comman').mason
table.insert(mason.ft, 'rust')
table.insert(mason.opts.ensure_installed, 'rust_analyzer')

local lsp = require('configs.comman').lsp
table.insert(lsp.ft, 'rust')

local cmp = require('configs.comman').cmp
table.insert(cmp.ft, 'rust')
cmp.event = 'InsertEnter'

local treesitter = require('configs.comman').treesitter
table.insert(treesitter.ft, 'rust')
table.insert(treesitter.opts.ensure_installed, 'rust')

local conform = require('configs.comman').coform
table.insert(conform.ft, 'rust')
conform.opts.formatters_by_ft.rust = 'rustfmt'

local rustaceanvim = {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',

  },
  opts = {
    server = {
      capabilities = require('configs.lsp').capabilities,
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<leader>dr", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          -- Add clippy lints for Rust.
          checkOnSave = {
            allFeatures = true,
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
  end,
}

local outline = require('configs.comman').outline
table.insert(outline.ft, 'rust')

return {
  -- mason
  mason,
  -- lsp
  lsp,
  -- cmp
  cmp,
  -- -- treesitter
  treesitter,
  -- -- formatting
  conform,
  -- rustaceanvim
  rustaceanvim,
  -- outline
  outline,
}
