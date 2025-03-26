call plug#begin('~/.vim/plugged')

" LSP sources for completion
Plug 'neovim/nvim-lspconfig'
Plug 'terryma/vim-multiple-cursors'

Plug 'sainnhe/sonokai'
Plug 'dracula/vim', { 'as': 'dracula-vim' }
Plug 'cocopon/iceberg.vim'
Plug 'folke/tokyonight.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'echasnovski/mini.nvim'
Plug 'clangd/coc-clangd'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'ap/vim-css-color'
Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-unimpaired'
Plug 'danihek/hellwal-vim'

call plug#end()

 syntax on
 filetype plugin indent on
 set ts=3 sts=2 sw=2 et ai si
 set incsearch
 set ignorecase
 set number relativenumber
 set nu rnu
 set tabstop=4
 set shiftwidth=4
 set expandtab
 set cursorline
 set wildmode=longest:full,full "replacement for glourius ido mode

 set list
 set listchars=space:·,tab:→\ ,trail:·

 "While searching and go C-d C-u its centred
 nnoremap n nzz
 nnoremap N Nzz
 nnoremap <C-d> <C-d>zz
 nnoremap <C-u> <C-u>zz
 
"Compile Mode | Something like emacs has I guess??? It's useful for me
 nnoremap <silent> <M-m> :Make<CR>

 " Status Line
 set laststatus=2

 if has('termguicolors')
   set termguicolors
 endif 

 "Vim multiple cursors
 let g:multi_cursor_use_default_mapping=0

 " Default mapping
 let g:multi_cursor_start_word_key      = '<C-n>'
 let g:multi_cursor_select_all_word_key = '<A-n>'
 let g:multi_cursor_start_key           = 'g<C-n>'
 let g:multi_cursor_select_all_key      = 'g<A-n>'
 let g:multi_cursor_next_key            = '<C-n>'
 let g:multi_cursor_prev_key            = '<C-p>'
 let g:multi_cursor_skip_key            = '<C-x>'
 let g:multi_cursor_quit_key            = '<Esc>'

set statusline=
set statusline+=%1*\ %n\ %*              " Buffer number
set statusline+=%5*\ [%{&encoding}]\ %*  " File encoding
set statusline+=%3*%y%*                  " File type
set statusline+=%4*\ %<%F%*              " Full path
set statusline+=%2*%m%*                  " Modified flag
set statusline+=%1*%=%5l%*               " Current line
set statusline+=%2*/%L%*                 " Total lines
set statusline+=%1*%4v%*                 " Virtual column number
set statusline+=%2*0x%04B%*              " Character under cursor (Hex)
set statusline+=%3*\ %#DarkRed#獄鬼%*     " "Hell Oni" with color

highlight DarkRed ctermfg=darkred guifg=#ff5555
colorscheme hellwal

 "Conquer of Completion
 inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
 inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
 inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
 inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"

 inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
 inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"

 inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
 inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

 inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
 inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<tab>"
