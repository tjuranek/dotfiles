" plugins
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" colorscheme
set termguicolors
let ayucolor="dark"
colorscheme ayu
"
" leader remap
let mapleader = " "

" line number config
set number
set relativenumber

" scroll config
set scrolloff=8

" tab config
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" coc config - these are mostly from repo readme to fix issues
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()  : "\<C-g>u<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions = ['coc-tsserver', 'coc-css']

map <leader>s :w<CR>
map <leader>q :wq!<CR>
