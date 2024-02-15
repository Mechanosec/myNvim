return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "VeryLazy",
	opts = {
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	},

	init = function()
		-- UFO folding
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		local fcs = vim.opt.fillchars:get()

		local function get_fold(lnum)
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
				return " "
			end
			return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
		end

		_G.get_statuscol = function()
			return get_fold(vim.v.lnum) .. " %s%l "
		end

		vim.o.statuscolumn = "%!v:lua.get_statuscol()"
	end,
}
