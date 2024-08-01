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
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = false,
			})

			vim.keymap.set(
				"n",
				"<leader>gco",
				"<cmd>GitConflictChooseOurs<cr>",
				{ desc = "Select the current changes" }
			)
			vim.keymap.set(
				"n",
				"<leader>gct",
				"<cmd>GitConflictChooseTheirs<cr>",
				{ desc = "Select the incoming changes" }
			)
			vim.keymap.set("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Select both changes" })
			vim.keymap.set(
				"n",
				"<leader>gcn",
				"<cmd>GitConflictNextConflict<cr>",
				{ desc = "Move to the next conflict" }
			)
			vim.keymap.set(
				"n",
				"<leader>gcn",
				"<cmd>GitConflictNextConflict<cr>",
				{ desc = "Move to the next conflict" }
			)
			vim.keymap.set(
				"n",
				"<leader>gcp",
				"<cmd>GitConflictPrevConflict<cr>",
				{ desc = "Move to the previous conflict" }
			)
		end,
	},
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
