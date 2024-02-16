return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({
				search_method = "cover_or_next",
			})
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.bufremove",
		event = "VeryLazy",
		keys = {
			{
				"<leader>x",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
		},
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		config = function()
			require("mini.indentscope").setup()
		end,
	},
}
