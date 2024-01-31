require("remaps")
require("options")

require("lazy_bootstrap") -- must be required before plugins list
require("plugins")

vim.api.nvim_set_hl(0, "Normal", { ctermbg=None, bg=None })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg=None, bg=None })
vim.api.nvim_set_hl(0, "SignColumn", { ctermbg=None, bg=None })

vim.g.airline_theme="base16_classic"
