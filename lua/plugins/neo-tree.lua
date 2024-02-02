return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", ":Neotree toggle reveal<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
			  {
			    event = "file_opened",
			    handler = function()
			      -- auto close
			      -- vimc.cmd("Neotree close")
			      -- OR
			      require("neo-tree.command").execute({ action = "close" })
			    end,
			  },
			},
		})
	end,
}
