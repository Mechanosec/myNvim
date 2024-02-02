return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
        globalstatus = true
				-- disabled_filetypes = { "neo-tree" },
			},
		})
	end,
}
