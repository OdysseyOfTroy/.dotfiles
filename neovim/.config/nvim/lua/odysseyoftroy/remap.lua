local opts = { noremap = true, silent = true }

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local OdysseyGroup = augroup('OdysseyOfTroy', {})

-- Tab navigation
vim.keymap.set("n", "]t", ":tabnext<CR>", opts)
vim.keymap.set("n", "[t", ":tabprev<CR>", opts)

-- Move lines
vim.keymap.set("n", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")

-- Lsp Autocommands
autocmd("LspAttach", {
    group = OdysseyGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})
