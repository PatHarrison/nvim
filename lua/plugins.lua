-- [[ plugins.lua ]]

-- bootstrap lazy.nvim
require("lazy_bootstrap")

-- 
require("lazy").setup({
    {"vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
	{
	"nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
	},

    {"preservim/nerdtree"},

	{"tpope/vim-fugitive"},
    {"tpope/vim-rhubarb"},

	{"vim-airline/vim-airline"},
	{"vim-airline/vim-airline-themes"},

    {"nvim-treesitter/nvim-treesitter",
        version = false,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },

    {"lervag/vimtex",
        config = function()
          -- VimTeX basic setup
          vim.g.vimtex_view_method = "sumatrapdf.exe"  -- Set SumatraPDF as the viewer
          vim.g.vimtex_view_general_viewer = "SumatraPDF"
          vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
          vim.g.vimtex_compiler_method = "latexmk"
        end
    },

    {"zchee/deoplete-jedi"},

    {"VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        }
    },

    {"ray-x/lsp_signature.nvim", -- Signature help
        event = "VeryLazy",
        opts = {bind=true,
                doc_lines=0,
                handler_opts = {
                    border = "none"
                }
        },
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    -- {
    --   "PatHarrison/miasma.nvim",
    --   lazy = false,
    --   config = function()
    --     vim.cmd("colorscheme miasma")
    --   end,
    -- },

    {"PatHarrison/mistwood.nvim",
        lazy = false,
        config = function()
            vim.cmd("colorscheme mistwood")
        end,
    },
})
