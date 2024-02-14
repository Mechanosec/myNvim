return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "node2", "js" },
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
				lsp_zero.buffer_autoformat()
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver", "lua_ls", "prismals" },
				handlers = {
					lsp_zero.default_setup,
					tsserver = function()
						lspconfig.tsserver.setup({
							on_init = function(client)
								client.server_capabilities.documentFormattingProvider = false
								client.server_capabilities.documentFormattingRangeProvider = false
							end,
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
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
}
