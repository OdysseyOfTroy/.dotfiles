return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 150,
        }
    },
    config = function()
            vim.keymap.set( "n", "<leader>z", ":ZenMode<CR>")
    end
}
