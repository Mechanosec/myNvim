local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
lsp_zero.set_sign_icons({
	error = signs.Error,
	warn = signs.Warn,
	hint = signs.Hint,
	info = signs.Info,
})

local lspconf = require("lspconfig")

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"vtsls",
		"prismals",
		"dockerls",
		"yamlls",
		"tailwindcss",
	},
	handlers = {
		function(server_name)
			lspconf[server_name].setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentFormattingRangeProvider = false
				end,
			})
		end,
		prismals = function()
			lspconf.prismals.setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = true
					client.server_capabilities.documentFormattingRangeProvider = true
				end,
			})
		end,
		yamlls = function()
			lspconf.yamlls.setup({
				yaml = {
					schemaStore = {
						enable = true,
					},
				},
			})
		end,
		vtsls = function()
			lspconf.vtsls.setup({
				settings = {
					typescript = {
						preferences = {
							importModuleSpecifier = "relative",
						},
					},
				},
			})
		end,
	},
})
