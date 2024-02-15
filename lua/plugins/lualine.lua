return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = true,
        -- disabled_filetypes = { "neo-tree" },
      },
      sections = {
        lualine_c = {
          "lsp_progress",
        },
      },
    })
  end,
}
