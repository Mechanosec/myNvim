local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	group = augroup("open_neotest"),
-- 	pattern = "*.spec.ts",
-- 	callback = function()
-- 		require("neotest").summary.toggle()
-- 	end,
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})
