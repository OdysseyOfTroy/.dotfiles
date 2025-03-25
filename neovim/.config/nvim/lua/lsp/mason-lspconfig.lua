return {
    "williamboman/mason-lspconfig",
    lazy = true,
    config = function()
        require("mason-lspconfig").setup({
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
