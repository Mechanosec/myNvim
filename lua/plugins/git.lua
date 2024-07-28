return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
			{ "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
			{ "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
			{ "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "All files history" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
		},
		opts = {},
	},
}
