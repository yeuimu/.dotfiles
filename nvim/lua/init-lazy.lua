-- clone lazy.nvim using git
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- setting env path
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    spec = {
      { import = "plugins" },
    },
    defaults = {
      lazy = true,
      version = false,
    },
    install = { colorscheme = { 'tokyonight-day' } },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  }
)
