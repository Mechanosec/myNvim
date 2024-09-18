local map = vim.keymap.set

map("n", "<c-n>", "<cmd>nohl<cr>")
map("n", "<leader>|", "<cmd>vsplit <CR>", { desc = "Vertical Split" })
map("n", "<leader>-", "<cmd>split <CR>", { desc = "Horisontal Split" })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Down" })

map("n", "<s-left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Vertical -" })
map("n", "<s-right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Vertical +" })
map("n", "<s-up>", "<cmd>horizontal resize +2<cr>", { desc = "Resize Horizontal +" })
map("n", "<s-down>", "<cmd>horizontal resize -2<cr>", { desc = "Resize Horizontal -" })
