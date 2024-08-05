local neotest = require("neotest")

neotest.setup({
	discovery = {
		filter_dir = function(name, rel_path, root)
			return name ~= "dist"
		end,
	},
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
	},
})
