" ==== Vanilla configuration ==== "

set tabstop=2
set shiftwidth=2
set softtabstop=2

" Tabs are spaces
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


" ==== COC.nvim Intellisense engine for Vim8 & Neovim ====
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Correct comment highlighting for jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" ==== HTML Template Literals: Syntax highlighting for html template literals in javascript ====

Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'

" reasonable indentation of <style>
let g:html_indent_style1 = "inc"

" Enable css syntax inside css-tagged template literals (css`...`).
let g:htl_css_templates = 1


" ==== closetag.vim: Auto close (X)HTML tags ====

Plug 'alvan/vim-closetag'

" configure the vim-closetag plugin to work inside html template literals

let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }

" ==== Vimtex: A modern vim plugin for editing LaTeX files. ====
Plug 'lervag/vimtex'

let g:vimtex_view_method = 'zathura'

"Flake8: a static syntax and style checker for Python source code
Plug 'nvie/vim-flake8'
let g:flake8_show_in_file=1  " show marks in the file

" ==== Vim-autopep8 is a Vim plugin that applies autopep8 to your current file ====

Plug 'tell-k/vim-autopep8'
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" === Dracula: Dark theme for Vim === 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wadackel/vim-dogrun'
runtime ~/.local/share/nvim/plugged/dracula/colors/dracula.vim
" Initialize plugin system
call plug#end()

" Set colorscheme after plugin declaration
"https://github.com/patstockwell/vim-monokai-tasty/issues/2#issuecomment-447676240
colorscheme dracula
