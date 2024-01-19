return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = {
    { "nvim-lua/plenary.nvim", },
--    {"nvim-treesitter/nvim-treesitter",
--      opts = {
--        auto_install = true,
--        highlight = {
--          enable = true,
--          additional_vim_regex_highlighting = false,
--        },
--      },
--      config = function(_,opts)
--        require('nvim-treesitter.configs').setup(opts)
--      end
--    },
--    { "folke/tokyonight.nvim", config=function(_,_) vim.cmd.colorscheme "tokyonight-storm" end,},
  },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "basic",
            folds = true,
          }
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Projects/notes",
            },
          },
        },
      },
    }
  end,
}

