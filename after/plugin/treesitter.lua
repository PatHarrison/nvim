require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
        --ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        ensure_installed = {
                "python", "lua", "vim", "sql", 
                "html", "javascript", "query"
                            },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },  
        additional_vim_regex_highlighting = true,

        custom_captures = {
            ["self"] = "Type",
        }
        })
    end
 }})

