local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jj", "<esc>", opts)

-- save
keymap.set("n", "<leader>w", ":w<cr>", { unpack(opts), desc = "Save File" })

-- escape
keymap.set("n", "<leader>q", ":q<cr>", { unpack(opts), desc = "Close" })

-- Split window
keymap.set("n", "ss", ":split<cr>", { unpack(opts), desc = "Horisontal" })
keymap.set("n", "sv", ":vsplit<cr>", { unpack(opts), desc = "Vertical" })

-- Resize window
-- keymap.set("n", "<leader>wh", "<C-w><")
-- keymap.set("n", "<leader>wl", "<C-w>>")
-- keymap.set("n", "<leader>wk", "<C-w>+")
-- keymap.set("n", "<leader>wj", "<C-w>-")

-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("n", "<C-n>", ":nohl<cr>")
