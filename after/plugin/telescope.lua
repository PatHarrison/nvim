local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
				}
			},
		},
	pickers = {},
	extensions = {}
}
