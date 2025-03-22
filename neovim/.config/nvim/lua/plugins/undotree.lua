return {
    "mbbill/undotree",

    keys = function()
	
	return {
    	    { mode = { "n" }, "<leader>u", vim.cmd.UndotreeToggle }
        }
    end
}
