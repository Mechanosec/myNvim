return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find File",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				"<cmd>Telescope buffers<cr>",
				desc = "Live Grep",
			},
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" },
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.45,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					mappings = {
						n = {
							["q"] = actions.close,
						},
						-- i = {
						-- 	["<esc>"] = actions.close,
						-- },
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Explorer" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						initial_mode = "normal",
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["o"] = function()
									vim.cmd("")
								end,
								["/"] = function()
									vim.cmd("startisert")
								end,
							},
						},
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"Slotos/telescope-lsp-handlers.nvim",
		opts = {},
	},
}
