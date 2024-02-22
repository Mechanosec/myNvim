return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
							preview_width = 0.55,
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
		keys = {
			{ "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Explorer" },
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
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"Slotos/telescope-lsp-handlers.nvim",
		config = function()
			require("telescope-lsp-handlers").setup()
		end,
	},
}
