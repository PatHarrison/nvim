require("remaps")
require("options")

require("lazy_bootstrap") -- must be required before plugins list
require("plugins")

vim.g.python3_host_prog = 'C:\\Program Files\\Python312\\python.exe'
require'lspconfig'.pyright.setup{}
