return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 170,
        }
    },
    keys = function() 
        return {
            { mode = { "n" }, "<leader>z", ":ZenMode<CR>" }
        }
    end
}
