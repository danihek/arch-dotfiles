call plug#begin('~/.vim/plugged')

" Completion engine
Plug 'hrsh7th/nvim-cmp'

" LSP sources for completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'terryma/vim-multiple-cursors'

" Snippets (optional, but recommended)
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

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

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF
