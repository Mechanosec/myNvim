return {
	{
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out", -- need run manually
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{
				"mxsdev/nvim-dap-vscode-js",
				requires = { "mfussenegger/nvim-dap" },
				config = function()
					require("dap-vscode-js").setup({
						debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
						adapters = { "pwa-node", "pwa-chrome", "node" }, -- which adapters to register in nvim-dap
					})
				end,
			},
		},
		config = function()
			local dap = require("dap")

			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dD", function()
				dap.disconnect({ terminateDebuggee = true })
			end, { desc = "Disconnect" })

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						-- processId = require("dap.utils").pick_process,
						protocol = "inspector",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
				}
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		dependencies = { "nvim-neotest/nvim-nio" },
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

			vim.keymap.set("n", "<leader>dU", dapui.toggle, { desc = "Toggle UI" })
		end,
	},
}
