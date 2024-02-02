return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find File",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      -- {
      --   "<leader>e",
      --   ":Telescope file_browser path=%:p:h select_buffer=true <cr>",
      --   desc = "Explorer",
      -- },
    },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          mappings = {
            n = {
              ["q"] = actions.close,
            },
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          -- file_browser = {
          --   initial_mode = "normal",
          --   hijack_netrw = true,
          --   mappings = {
          --     ["n"] = {
          --       ["o"] = function()
          --         vim.cmd("")
          --       end,
          --       ["/"] = function()
          --         vim.cmd("startisert")
          --       end,
          --     },
          --   },
          -- },
        },
      })
      require("telescope").load_extension("ui-select")
      -- require("telescope").load_extension("file_browser")
    end,
  },
}
