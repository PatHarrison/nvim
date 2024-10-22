local g = vim.g;

g.vimtex_enabled = 1
g.vimtex_view_method = 'SumatraPDF.exe'
g.vimtex_view_general_viewer = "SumatraPDF.exe"
g.vimtex_view_general_options = '-reuse-instance'
g.TexBibtexFlavor = 'biber'
g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {'-pdf', '-synctex=1', '-interaction=nonstopmode'},
}

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
