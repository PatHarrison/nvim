local g = vim.g;

-- Key mappings for Vimtex
vim.api.nvim_set_keymap('n', '<Leader>ll', [[:VimtexCompile<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lv', [[:VimtexView<CR>]], { noremap = true, silent = true })

-- Additional configurations can be added as needed

-- Autocommands for automatic compilation on save
--vim.api.nvim_exec([[
--  augroup vimtex_autocommands
--    autocmd!
--    autocmd BufWritePost *.tex :VimtexCompile
--  augroup END
--]], false)
