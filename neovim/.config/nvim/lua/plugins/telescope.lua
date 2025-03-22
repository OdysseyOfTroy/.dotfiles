return {
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
}
