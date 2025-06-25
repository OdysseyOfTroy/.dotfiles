return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    local harpoon = require("harpoon")

    --REQUIRED--
    harpoon:setup()
    --REQUIRED--

    -- basic telescope configuration
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end


    --KEYMAPS--
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
    -- hl = harpoon list
    vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
    -- h1 = harpoon 1
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
    -- h2 = harpoon 2
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
    -- h3 = harpoon 3
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
    -- h4 = harpoon 4
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
    --KEYMAPS--
    end

}
