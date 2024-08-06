return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
}
