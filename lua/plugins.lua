-- [[ plugins.lua ]]

-- bootstrap lazy.nvim
require("lazy_bootstrap")

-- 
require("lazy").setup({

	{
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{'tpope/vim-fugitive'},

	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes'},

	{'nvim-treesitter/nvim-treesitter'},

	{'xero/miasma.nvim'}
})
