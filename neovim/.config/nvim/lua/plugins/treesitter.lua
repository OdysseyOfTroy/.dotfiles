return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require "nvim-treesitter.configs".setup({
            ensure_installed = {
                "query",
                "javascript",
                "typescript",
                "rust",
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline"
            },
            highlight = { enable = true },
            indent = { enable = true },
    })
end
}
