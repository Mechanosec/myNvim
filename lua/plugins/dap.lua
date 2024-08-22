return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "Eval",
			},
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
			require("config.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			local dapui = require("dapui")

			dapui.setup({
				expand_lines = false,
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
