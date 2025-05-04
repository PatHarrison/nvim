-- [[ after/plugin/nerdtree.lua ]]


vim.cmd([[autocmd VimEnter * NERDTree | wincmd p]])
vim.cmd([[autocmd BufEnter * if tabpagenr('$') == 2 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]])
vim.cmd([[autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]])
