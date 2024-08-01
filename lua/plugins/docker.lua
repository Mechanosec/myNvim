return {
	{
		"crnvl96/lazydocker.nvim",
		event = "VeryLazy",
		opts = {}, -- automatically calls `require("lazydocker").setup()`
		keys = { { "<leader>k", "<cmd>LazyDocker<CR>", desc = "Toggle LazyDocker" } },
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
