local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tab navigation
vim.keymap.set("n", "]t", ":tabnext<CR>", opts)
vim.keymap.set("n", "[t", ":tabprev<CR>", opts)
