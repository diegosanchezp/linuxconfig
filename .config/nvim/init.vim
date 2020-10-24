" ==== Vanilla configuration ==== "
let mapleader =","

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

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Highlight when searching, then set off after search done
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" ==== Vim plug configuration ==== "

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" ==== COC.nvim Intellisense engine for Vim8 & Neovim ====
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ==== closetag.vim: Auto close (X)HTML tags ====
Plug 'alvan/vim-closetag'

" ==== Vim-orgmode: Text outlining and task management for Vim based on Emacs' Org-Mode ==== 
Plug 'jceb/vim-orgmode'

" ==== HTML Template Literals: Syntax highlighting for html template literals in javascript ====
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'

" ==== Vimtex: a modern Vim and neovim filetype plugin for LaTeX files ====
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

" ==== COC.nvim Intellisense engine for Vim8 & Neovim ====

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


" ==== closetag.vim: Auto close (X)HTML tags ====

" configure the vim-closetag plugin to work inside html template literals
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }

" ==== HTML Template Literals: Syntax highlighting for html template literals in javascript ====

" reasonable indentation of <style>
let g:html_indent_style1 = "inc"

" Enable css syntax inside css-tagged template literals (css`...`).
let g:htl_css_templates = 1

"(Experimental) Enable html syntax inside all template literals (`...`).
let g:htl_all_templates = 1

" ==== Vimtex: a modern Vim and neovim filetype plugin for LaTeX files ====
" vimtex-tex-flavor
let g:tex_flavor = 'latex'

let g:vimtex_view_method = 'zathura'
