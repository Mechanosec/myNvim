return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "node2" },
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup({
				layouts = {
					{
						elements = {
							-- Elements can be strings or table with id and size keys.
							{ id = "scopes", size = 0.7 },
							{ id = "breakpoints", size = 0.3 },
						},
						size = 85,
						position = "right",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end

			vim.keymap.set("n", "<leader>dU", dapui.toggle)
		end,
	},
}
