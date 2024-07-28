local cmp = require("cmp")

local tailwindcss_colors = require("tailwindcss-colorizer-cmp")

local cmp_formatter = function(entry, vim_item)
	vim_item = tailwindcss_colors.formatter(entry, vim_item)

	-- change menu (name of source)
	vim_item.menu = ({
		nvim_lsp = "[LSP]",
		buffer = "[Buffer]",
		path = "[Path]",
		emoji = "[Emoji]",
		luasnip = "[LuaSnip]",
		vsnip = "[VSCode Snippet]",
		calc = "[Calc]",
		spell = "[Spell]",
	})[entry.source.name]
	return vim_item
end

cmp.setup({
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = cmp_formatter,
	},

	mapping = cmp.mapping.preset.insert({
		["<tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
		["<S-tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{
			name = "lazydev",
			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		},
		-- { name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
