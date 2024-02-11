return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      -- current_line_blame = true,
      -- current_line_blame_opts = {
      -- 	virt_text_pos = "eol",
      -- 	delay = 400,
      -- },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gd", ":DiffviewOpen<cr>",          desc = "Diffview open" },
      { "<leader>gc", ":DiffviewClose<cr>",         desc = "Diffview close" },
      { "<leader>gh", ":DiffviewFileHistory %<cr>", desc = "Current file history" },
      { "<leader>gH", ":DiffviewFileHistory<cr>",   desc = "All files history" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
