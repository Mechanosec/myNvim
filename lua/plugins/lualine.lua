return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppucin",
        globalstatus = true
				-- disabled_filetypes = { "neo-tree" },
			},
		})
	end,
}
