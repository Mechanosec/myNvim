return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<Tab>", ":bnext<cr>", desc = "Next tab" },
			{ "<S-Tab>", ":bprevious<cr>", desc = "Prev tab" },
		},
		opts = {
			options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local signs = require("icons").signs
					local ret = (diag.error and signs.Error .. diag.error .. " " or "")
						.. (diag.warning and signs.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},
}
