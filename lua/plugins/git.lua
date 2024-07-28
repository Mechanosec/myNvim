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
			{ "<leader>gdd", ":DiffviewOpen<cr>", desc = "Diffview open" },
			{ "<leader>gdc", ":DiffviewClose<cr>", desc = "Diffview close" },
			{ "<leader>gdh", ":DiffviewFileHistory %<cr>", desc = "Current file history" },
			{ "<leader>gdH", ":DiffviewFileHistory<cr>", desc = "All files history" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 700,
			},
		},
	},
}
