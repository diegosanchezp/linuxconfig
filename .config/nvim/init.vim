" ==== Vanilla configuration ==== "

set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
syntax on
set wrap
set relativenumber
set number
set clipboard+=unnamedplus
filetype on

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
" ==== Vim plug configuration ==== "

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" ==== YouCompleteMe: a code-completion engine for Vim ====
" Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --ts-completer --clangd-completer' }

" This option controls for which filetypes should YCM be turned on 
" let g:ycm_filetype_whitelist = {
" 			\ "c":1,
" 			\ "cpp":1,
" 			\ "objc":1,
" 			\ "sh":1,
" 			\ "zsh":1,
" 			\ "zimbu":1,
" 			\ "py":1,
" 			\ }
" ==== Coc.nvim Intellisense engine for Vim8 & Neovim ==== "

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" To get correct comment highlighting on jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Config extensions to install
" call coc#add_extension('coc-tsserver','coc-json','coc-html','coc-css','coc-svelte','coc-angular','coc-vimtex')
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-svelte',
  \ 'coc-angular',
  \ 'coc-vimtex',
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ==== END Coc.nvim  configuration ==== "

" Coc extensions

" Web development
Plug 'leafgarland/typescript-vim'
Plug 'evanleck/vim-svelte'
" LaTeX

" ==== Vimtex: A modern vim plugin for editing LaTeX files. ====
Plug 'lervag/vimtex'

let g:vimtex_view_method = 'zathura'

"Flake8: a static syntax and style checker for Python source code
Plug 'nvie/vim-flake8'
let g:flake8_show_in_file=1  " show marks in the file

" ==== Vim-autopep8 is a Vim plugin that applies autopep8 to your current file ====

Plug 'tell-k/vim-autopep8'
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Initialize plugin system
call plug#end()
