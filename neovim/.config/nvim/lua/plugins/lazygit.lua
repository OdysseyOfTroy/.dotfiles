return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFulterCurrentFile",
    },
    dependancies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    }
}
