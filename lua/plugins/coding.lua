return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			lsp_zero.extend_lspconfig()

			local signs = require("icons").signs
			lsp_zero.set_sign_icons({
				error = signs.Error,
				warn = signs.Warn,
				hint = signs.Hint,
				info = signs.Info,
			})

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
				vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = bufnr, desc = "Line diagnostic" })
				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        -- stylua: ignore
        vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
				vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format" })
        -- stylua: ignore
        vim.keymap.set("n", "<leader>lt", ":TroubleToggle document_diagnostics<cr>", { buffer = bufnr, desc = "Trouble" })
				vim.keymap.set("n", "<leader>ln", ":Navbuddy<cr>", { buffer = bufnr, desc = "Nvigation" })

				lsp_zero.buffer_autoformat()
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "prismals", "yamlls", "marksman" },
				handlers = {
					lsp_zero.default_setup,
					lsp_zero.set_server_config({
						on_init = function(client)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentFormattingRangeProvider = false
						end,
					}),
					prismals = function()
						lspconfig.prismals.setup({
							on_init = function(client)
								client.server_capabilities.documentFormattingProvider = true
								client.server_capabilities.documentFormattingRangeProvider = true
							end,
						})
					end,
					tsserver = function()
						lspconfig.tsserver.setup({
							init_options = {
								preferences = {
									importModuleSpecifierPreference = "relative",
									importModuleSpecifierEnding = "minimal",
								},
							},
						})
					end,
				},
			})

			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
					["<S-tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
