return {
  -- -- Theme
  -- Default theme
  {
    'shaunsingh/nord.nvim',
    priority = 50,
    config = function()
      vim.cmd.colorscheme('nord')
      vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    end,
  },
  -- *.lua
  {
    'folke/tokyonight.nvim',
    ft = { 'lua', 'markdown', 'python', 'rust' },
    priority = 1000,
    opts = { style = 'moon' },
    config = function()
      vim.cmd.colorscheme('tokyonight')
      -- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    end,
  },
  -- *.norg
  {
    'rebelot/kanagawa.nvim',
    ft = { 'norg' },
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('kanagawa')
      vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    end,
  },
  -- headline
  {
    'lukas-reineke/headlines.nvim',
    ft = { 'markdown' },
    priority = 1000,
    config = function()
      require('headlines').setup({
        markdown = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
                (block_quote (paragraph (block_continuation) @quote))
                (block_quote (block_continuation) @quote)
            ]]
          ),
          headline_highlights = { 'Headline' },
          codeblock_highlight = 'CodeBlock',
          dash_highlight = 'Dash',
          dash_string = '-',
          quote_highlight = 'Quote',
          quote_string = '┃',
          fat_headlines = true,
          fat_headline_upper_string = '▃',
          fat_headline_lower_string = '🬂',
        },
        rmd = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
                (block_quote (paragraph (block_continuation) @quote))
                (block_quote (block_continuation) @quote)
            ]]
          ),
          treesitter_language = 'markdown',
          headline_highlights = { 'Headline' },
          codeblock_highlight = 'CodeBlock',
          dash_highlight = 'Dash',
          dash_string = '-',
          quote_highlight = 'Quote',
          quote_string = '┃',
          fat_headlines = true,
          fat_headline_upper_string = '▃',
          fat_headline_lower_string = '🬂',
        },
      })
    end,
  },
}
