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
	fold = {
		enable = true,
	},
})

-- Use Treesitter for folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Optionally, set the default fold level to start unfolded
vim.opt.foldlevel = 99
