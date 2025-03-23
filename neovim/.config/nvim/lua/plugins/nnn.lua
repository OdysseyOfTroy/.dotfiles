return {
    'luukvbaal/nnn.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = function()
        require("nnn").setup()
        vim.keymap.set("n", "<leader>n", ":NnnPicker<CR>")
        vim.keymap.set("n", "<leader>m", ":NnnExplorer<CR>")
    end
}
