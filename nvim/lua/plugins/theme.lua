return {
--  "rebelot/kanagawa.nvim",
--  config = function()
--    vim.cmd.colorscheme('kanagawa')
--  end
		'shaunsingh/nord.nvim',
		lazy = false,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false

			require('nord').set()
		end
}
