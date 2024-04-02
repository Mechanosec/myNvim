return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
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
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				query = {
					"rainbow-parens",
					tsx = "rainbow-parens-react",
					jsx = "rainbow-parens-react",
				},
			},
			autotag = { enable = true },
		})
	end,
}
