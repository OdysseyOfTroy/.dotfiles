return {

    "neovim/nvim-lspconfig",
    event = { "bufReadPre", "BufNewFile" },
    dependancies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/lazydev.nvim",
    },
    config = function()
        require('lazydev').setup()
        require('mason').setup({})
        require('mason-lspconfig').setup({
        ensure_installed = {
            'rust_analyzer',
            'ts_ls',
            'emmet_ls',
            'lua_ls',
            'jsonls',
            'bashls',
        },
        handlers = {
            function(server_name)
                require('lspconfig')[server_name].setup({})
            end,
        },
        })
    end
}
