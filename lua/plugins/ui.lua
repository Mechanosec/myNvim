return {
	{
  'stevearc/dressing.nvim',
  opts = {},
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
     {
      "<leader>f",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "+Find",
    },
  },
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				-- disabled_filetypes = { "neo-tree" },
			},
			sections = {
				lualine_c = {
					"filename",
					"lsp_progress",
				},
			},
		})
	end,
}
}
