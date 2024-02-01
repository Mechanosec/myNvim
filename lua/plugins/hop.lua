return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
  end,
  keys = {
    {"<leader><leader>", "<cmd>HopWord<cr>", desc="HopWord"}
  }
}
