return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
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
							{
								id = "scopes",
								size = 0.75,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
						},
						position = "right",
						size = 70,
					},
					{
						elements = {
							{
								id = "repl",
								size = 1,
							},
						},
						position = "bottom",
						size = 10,
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
