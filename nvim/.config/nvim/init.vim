" ==== Vanilla configuration ==== "
let mapleader =","
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set confirm

set tabstop=2
set shiftwidth=2
set softtabstop=2

set encoding=utf-8

" Tabs are spaces
set expandtab

set noshiftround
set autoindent
syntax on
set wrap
set relativenumber
set number
set clipboard+=unnamedplus
set foldmethod=indent
filetype on


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

" ==== Functions ==== "
" https://vi.stackexchange.com/a/456

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ==== Commands ==== "
command! TrimWhitespace call TrimWhitespace()

" ==== Key mappings ==== "
" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Trim whitespaces from file
:noremap <Leader>t :call TrimWhitespace()<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Spanish orthography
map <leader>so :setlocal spell! spelllang=es<CR>

" Spanish and dual english orthography
map <leader>do :setlocal spell! spelllang=en_us,es<CR>

:noremap <leader>l :diffget 1<CR>
:noremap <leader>r :diffget 3<CR>

" ==== Vim plug configuration ==== "

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" ==== closetag.vim: Auto close (X)HTML tags ====
Plug 'alvan/vim-closetag'

" ==== Vim-orgmode: Text outlining and task management for Vim based on Emacs' Org-Mode ====
Plug 'jceb/vim-orgmode'

" ==== HTML Template Literals: Syntax highlighting for html template literals in javascript ====
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'

" ====  React JSX syntax highlighting for vim and Typescript  ====
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" ==== Vimtex: a modern Vim and neovim filetype plugin for LaTeX files ====
Plug 'lervag/vimtex'

" ==== emmet for vim ====
Plug 'mattn/emmet-vim'

" Quickstart configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" === Snippets plugin ===
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" ====  Auto completion Lua plugin for nvim
Plug 'hrsh7th/nvim-cmp'
" ==== LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug  'uga-rosa/cmp-dictionary'

" ====  Modern theme for modern VIMs  ====
Plug 'ayu-theme/ayu-vim' " or other package manager

Plug 'glench/vim-jinja2-syntax'

" Initialize plugin system
call plug#end()

set background=dark
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
runtime colors/ayu.vim
let s:fg_comment = "#FFFFFF"
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

" ====  React JSX syntax highlighting for vim and Typescript  ====
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"  Highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ==== LSP config (the mappings used in the default file don't quite work right)

" ==== Vim telescope mappings using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>

set dictionary+=/usr/share/dict/spanish,/usr/share/dict/words
" ====  Lua config "
lua << EOF
-- Telescope configuration
local telescope = require("telescope")
local telescope_actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_ignore_patterns = {"node_modules", ".git"},
    path_display = {"smart"},
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    help_tags = {
      theme = "dropdown",
    },
    oldfiles = {
      theme = "dropdown",
    },
  },
}
vim.o.completeopt = "menuone,noselect"
vim.o.background = "dark"

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  buf_set_keymap('n', 'gs', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<C-p>', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-n>', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local nvim_lsp = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
vim.lsp.set_log_level("debug")
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pylsp', 'svelte', 'tsserver', 'cssls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities),
    flags = {
      debounce_text_changes = 150,
      }
    }
end

nvim_lsp.html.setup{
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities),
  filetypes = { "html", "htmldjango", "jinja.html" },
}


-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  preselect = false,
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end,
  },
  mapping = {
    ['<C-s>'] = cmp.mapping.scroll_docs(-4),
    ['<C-h>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    {
      name = "dictionary",
      keyword_length = 2,
    },
  },
}

EOF
