-- [[ plugins.lua ]]

-- bootstrap lazy.nvim
require("lazy_bootstrap")

-- 
require("lazy").setup({

	{
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' }
	},

    {'preservim/nerdtree'},

	{'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},

	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes'},

	{'nvim-treesitter/nvim-treesitter', tag = 'v0.9.1'},

    {
      "xero/miasma.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd("colorscheme miasma")
      end,
    },
})
