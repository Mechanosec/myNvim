return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>dc", '<cmd>lua require"dap".continue()<CR>', desc = "Continue" },
			{ "<Leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', desc = "Toggle breakpoint" },
			{ "<Leader>du", '<cmd>lua require"dapui".toggle()<CR>', desc = "Toggle ui" },
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "->", texthl = "", linehl = "", numhl = "" })

			local ok, dap = pcall(require, "dap")
			if not ok then
				return
			end
			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "node2",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "node2",
						name = "node attach",
						request = "attach",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						protocol = "inspector",
					},
				}
			end

			dap.adapters.node2 = {
				type = "executable",
				command = "node-debug2-adapter",
				args = {},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			local dapui = require("dapui")

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
		end,
		dependencies = {
			"nvim-neotest/nvim-nio",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
	},
}
