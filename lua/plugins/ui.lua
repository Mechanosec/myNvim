return {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("config.which-key")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local dap = require("dap")
			local dap_status = function()
				if dap.session() then
					return " " .. dap.status()
				else
					return " Inactive"
				end
			end

			require("lualine").setup({
				options = {
					globalstatus = true,
				},
				sections = {
					lualine_c = {
						"filename",
						"lsp_progress",
					},
					lualine_x = {
						{
							function()
								local recording_register = vim.fn.reg_recording()
								if recording_register == "" then
									return ""
								else
									return "Recording @" .. recording_register
								end
							end,
							color = { fg = "green" },
						},
					},
					lualine_y = { dap_status },
				},
			})
		end,
	},
	{
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		keys = {
			{ "<Tab>", "<cmd>BufferNext<cr>" },
			{ "<S-Tab>", "<cmd>BufferPrev<cr>" },
			{ "<leader>bd", "<cmd>BufferClose<cr>" },
			{ "<leader>bD", "<cmd>BufferCloseAllButCurrent<cr>" },
		},

		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{ "rcarriga/nvim-notify", opts = { timeout = 1 } },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
		},
		config = function(_, opts)
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			opts.scope = { highlight = highlight }
			require("ibl").setup(opts)

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
