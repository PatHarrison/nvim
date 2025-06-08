-- [[ lua/plugins.lua ]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    -- Lazy handles itself
    {"folke/lazy.nvim", version = "*" },

    {"vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config
        config = true,
    },

    {"nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope"
    },

    {"preservim/nerdtree"},

    {"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" }
    },
    {"nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle"
    },

    {"tpope/vim-fugitive",
        cmd = { "Git", "G" }
    },
    {"tpope/vim-rhubarb",
        event = "VeryLazy"
    },

    {"lervag/vimtex",
        config = function()
            -- Enable continuous compilation
            vim.g.vimtex_compiler_latexmk = {
                continuous = 1,
            }

            -- Automatically open PDF viewer after first compilation
            vim.g.vimtex_view_automatic = 1

            -- SumatraPDF configuration
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
            vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
        end
    },

    {
        "VonHeikemen/lsp-zero.nvim",
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
    {"ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind=true, doc_lines=0,
            handler_opts = {
                border = "none"
            }
        },
        config = function(_ ,opts) require("lsp_signature").setup(opts) end
    },
	{"vim-airline/vim-airline"},
	{"vim-airline/vim-airline-themes",
        config = function()
            vim.cmd([[let g:airline_theme = 'minimalist']])
        end
    },

    {
        "PatHarrison/mistwood.nvim",
        name = "mistwood",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd("colorscheme mistwood")
        end
    }
})
