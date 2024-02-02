return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "jsdoc" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
}
