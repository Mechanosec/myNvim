return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		-- require("notify")("My super important message")
		vim.notify = require("notify")
	end,
}
