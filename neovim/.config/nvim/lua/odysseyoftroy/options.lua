vim.g.mapleader = " " -- use <space> as the leader key
vim.o.cmdheight = 0
vim.o.mouse = "" -- disable mouse support
vim.o.tabstop = 4 -- show existing tab with 4 space width
vim.o.shiftwidth = 4 -- when indenting with ">", use 4 space width
vim.o.softtabstop = 4 -- edit as if tabs are 4 characters wide
vim.o.expandtab = true -- on pressing tab, insert 4 spaces
vim.o.linebreak = true -- insert linebreak forcing wrap without breaking words
vim.o.laststatus = 3 -- make statusline global
vim.o.number = true -- show the current line number
vim.o.relativenumber = true -- show relative line numbers
vim.opt.conceallevel = 1
vim.opt.swapfile = false

-- Grep settings
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"

-- Ignore folders
vim.opt.wildignore = { "**/dist/*",
    "**/coverage/*",
    "**/node_modules/*",
    "**/.git/*",
    "*build/*"
    }
