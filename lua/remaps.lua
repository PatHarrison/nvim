-- [[ lua/remaps.lua ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = require("utils").map


-- Window Movements
map("n", "<C-J>", "<C-W>j")
map("n", "<C-K>", "<C-W>k")
map("n", "<C-H>", "<C-W>h")
map("n", "<C-L>", "<C-W>l")

-- netrw
map("n", "<leader>e", ":Ex<return>")

-- nerdtree
map("n", "<leader>t", ":NERDTreeToggle<return>")
