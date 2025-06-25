require "odysseyoftroy.options"
require "odysseyoftroy.remap"
require "odysseyoftroy.lazy"

local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
    local server_name = vim.fn.fnamemodify(f, ':t:r')
    table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
        vim.diagnostic.open_float(nil, {focus = false})
    end
})
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#ffffff", bg = "NONE" })
