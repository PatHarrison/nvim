--[[ plug.lua ]]
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
    Plug('tpope/vim-fugitive')
    Plug('morhetz/gruvbox')
    Plug('vim-airline/vim-airline')
    Plug('lervag/vimtex')
vim.call('plug#end')
