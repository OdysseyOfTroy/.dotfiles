return {

    "neovim/nvim-lspconfig",
config = function()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 
        'rust_analyzer',
        'ts_ls',
        'emmet_ls',
        'lua_ls',
        'jsonls',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})
end 
}
