-- [[ remaps.lua ]]

vim.g.mapleader = " "

local map = require("utils").map


-- Window Movements
map("n", "<C-J>", "<C-W>j")
map("n", "<C-K>", "<C-W>k")
map("n", "<C-H>", "<C-W>h")
map("n", "<C-L>", "<C-W>l")

-- netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
