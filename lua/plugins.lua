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
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
	},

    {'preservim/nerdtree'},

	{'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},

	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes',
        config = function()
            vim.cmd(":AirlineTheme minimalist")
        end
    },

    {"L3MON4D3/LuaSnip", 
        event = "VeryLazy",
        config = function()
            require("luasnip.loaders.from_lua").load({paths = "./snippets"})
        end
    },

    {"nvim-treesitter/nvim-treesitter",
        version = false,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { 
                    "c", "lua", "vim", "vimdoc", "query", 
                    "python", "sql", "tex", "rust"
                },
                auto_install = false,
                highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-n>",
                        node_incremental = "<C-n>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-m>",
                    }
                }
            })
        end
    },

    {'lervag/vimtex',
        config = function()
          -- VimTeX basic setup
          vim.g.vimtex_view_method = 'sumatrapdf.exe'  -- Set SumatraPDF as the viewer
          vim.g.vimtex_view_general_viewer = 'SumatraPDF'
          vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
          vim.g.vimtex_compiler_method = 'latexmk'
        end
    },

    {'zchee/deoplete-jedi'},

    { "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                completion = {
                    autocomplete = false
                },
                mapping = cmp.mapping.preset.insert ({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                        end, { "i", "s" }
                    ),
                    ["<s-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                        end, { "i", "s" }
                    ),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select=true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }
            })
        end
    },

    {"neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            require('mason').setup()
            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {
                ensure_installed = { "pyright", "texlab" }
            }
            require("lspconfig").pyright.setup {
                capabilities = capabilities,
            }
        end
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
