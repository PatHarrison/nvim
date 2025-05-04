-- [[ lua/utils.lua ]]

local M = {}

function M.map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs)
end

return M
