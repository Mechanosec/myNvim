return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint_d",
				"stylua",
				"prettier",
				"yamlfmt",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					-- trigger FileType event to possibly load this newly installed LSP server
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "tsserver", "html", "prismals", "yamlls", "marksman" },
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			mason_lspconfig.setup_handlers({
				function(server_name)
					if server_name == "tsserver" then
						lspconfig.tsserver.setup({
							capabilities = capabilities,
							on_init = function(client)
								client.server_capabilities.documentFormattingProvider = false
								client.server_capabilities.documentFormattingRangeProvider = false
							end,
						})
					else
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end
				end,
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
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
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			local signs = require("icons").signs
			lsp_zero.set_sign_icons({
				error = signs.Error,
				warn = signs.Warn,
				hint = signs.Hint,
				info = signs.Info,
			})

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
				lsp_zero.buffer_autoformat()
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
				vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
				vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = bufnr, desc = "Line diagnostic" })

				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        -- stylua: ignore
        vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
				vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format" })
        -- stylua: ignore
        vim.keymap.set("n", "<leader>lt", ":TroubleToggle document_diagnostics<cr>", { buffer = bufnr, desc = "Trouble" })
				vim.keymap.set("n", "<leader>ln", ":Navbuddy<cr>", { buffer = bufnr, desc = "Nvigation" })
			end)
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
