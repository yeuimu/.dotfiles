return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  dependencies = {
    'neovim/nvim-lspconfig',
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
          'rust_analyzer',
        },
        automatic_installation = true,
      },
      config = function(_, opts)
        require('mason-lspconfig').setup(opts)
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
      },
      config = function()
        local opts = require('configs.cmp')
        require('cmp').setup(opts)
      end,
    },
  },
  opts = {
    server = {
      capabilities = require('configs.lspconfig').capabilities,
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
