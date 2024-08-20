return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause()
				end,
				desc = "Pause",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<Leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle ui",
			},
		},
		config = function()
			local ok, dap = pcall(require, "dap")
			if not ok then
				return
			end
			dap.configurations.typescript = {
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
			dap.adapters.node2 = {
				type = "executable",
				command = "node-debug2-adapter",
				args = {},
			}

			-- dap.adapters["pwa-node"] = {
			-- 	type = "server",
			-- 	host = "localhost",
			-- 	port = "${port}",
			-- 	executable = {
			-- 		command = "node",
			-- 		args = {
			-- 			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			-- 			"${port}",
			-- 		},
			-- 	},
			-- }
			--
			-- for _, language in ipairs({ "typescript", "javascript" }) do
			-- 	dap.configurations[language] = {
			-- 		{
			-- 			type = "pwa-node",
			-- 			request = "launch",
			-- 			name = "Launch file",
			-- 			program = "${file}",
			-- 			cwd = "${workspaceFolder}",
			-- 		},
			-- 		{
			-- 			type = "pwa-node",
			-- 			name = "node attach",
			-- 			request = "attach",
			-- 			program = "${file}",
			-- 			cwd = vim.fn.getcwd(),
			-- 			sourceMaps = true,
			-- 			protocol = "inspector",
			-- 		},
			-- 	}
			-- end

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
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
						size = 5,
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
