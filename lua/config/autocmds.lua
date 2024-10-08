local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = augroup("prisma_generate"),
-- 	pattern = "schema.prisma",
-- 	callback = function()
-- 		-- Асинхронное выполнение prisma generate
-- 		local handle
-- 		handle = vim.loop.spawn("npx", {
-- 			args = { "prisma", "generate" },
-- 		}, function(code, signal)
-- 			if code == 0 then
-- 				-- Если команда выполнена успешно, перезапускаем LSP
-- 				vim.schedule(function()
-- 					local active_clients = vim.lsp.get_clients()
-- 					for _, client in ipairs(active_clients) do
-- 						if client.name == "vtsls" then
-- 							vim.lsp.stop_client(client.id)
-- 						end
-- 					end
-- 					-- Открываем файл для обновления
-- 					vim.cmd("edit")
-- 				end)
-- 			else
-- 				print("Prisma generate завершился с ошибкой: код", code)
-- 			end
-- 			handle:close()
-- 		end)
-- 	end,
-- })

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
