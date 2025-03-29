return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = function()
            local telescope = require("telescope.builtin");

            return {
                { mode = { "n" }, "<leader>ff", function() telescope.find_files({ hidden = true }) end },
                { mode = { "n" }, "<C-p>", telescope.git_files, { desc = "Telescope find git files" }},
                { mode = { "n" }, "<leader>fs", function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end }
           }
       end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                  }
                }
              }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
