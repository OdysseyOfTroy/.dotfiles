return {
    "williamboman/mason-lspconfig",
    lazy = true,
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
            'ts_ls',
            'emmet_ls',
            'lua_ls',
            'jsonls',
            'bashls',
            },
        })
    end
}
