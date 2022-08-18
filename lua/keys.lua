--[[ keys.lua ]]

-- Import & assign the map() func from utils
local map = require("utils").map

-- Window movements
map("n", "<C-J>", "<C-W>j")
map("n", "<C-K>", "<C-W>k")
map("n", "<C-H>", "<C-W>h")
map("n", "<C-L>", "<C-W>l")

-- Nerdtree
map("n", "<C-n>", ":NERDTreeToggle<CR>")
