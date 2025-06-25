local function normalise_path(path)
    return path:gsub("\\", "/")
end

local function normalise_cwd()
    -- lua_ls linting is incorrect, vim.loop.cwd works at runtime.
    -- to check that cwd is working run :lua print(vim.loop.cwd())
    return normalise_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
  local normalized_path = normalise_path(path)
  local normalized_cwd = normalise_cwd()
  local filename = normalized_path:match("[^/]+$")

  if is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

local function path_display(_, path)
  local stripped_path, filename = split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s ~ %s", filename, stripped_path)
end

return {
    --BASE TELESCOPE--
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            defaults = {
                path_display = path_display,
                layout_config = {
                    horizontal = {
                        width = { padding = 0 },
                        height = { padding = 0 },
                        preview_width = 0.6,
                    },
                },
            },
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
    --TELESCOPE FOR NEOVIM CORE--
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
