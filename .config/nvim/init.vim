" *******
" Plugins
" *******

call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'                           " Colorscheme
Plug 'ap/vim-buftabline'                         " Adds tabline with openned buffers
Plug 'sheerun/vim-polyglot'                      " Better syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Language Server Protocol implementation
Plug 'preservim/nerdtree'                        " File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'               " NERDTree plugin for git support

call plug#end()


" **********
" Parameters
" **********

set title               " More verbose terminal' title
set number              " Shows line numbers
set relativenumber      " Makes line numbers relative to current line
set ignorecase          " Case insensitive search by default
set mouse=a             " Enables mouse interaction in most modes
set showmatch           " Highlights matching bracket
set nostartofline       " Jump to first non-blank character
set fileencoding=utf-8  " Converts content encoding of the current buffer to UTF-8
set nowrap              " Disables wrapping
set linebreak           " More beautiful line wrapping
set hidden              " Allow to hide buffers
set splitright          " Puts new window right of the current one
set splitbelow          " Puts new window below the current one
set noswapfile          " Disables creation of swap file for the buffer
set nobackup            
set nowritebackup
set smartindent         " Uses smart indenting
set expandtab           " Uses spaces instead of tab
set shiftwidth=4        " Uses N spaces for indentation
set nofoldenable        " Disable folding by default
set foldmethod=syntax   " Folding method is based on syntax highlighting
set diffopt+=vertical   " Set vertical layout for diffs by default
set scrolloff=8         " Keeps N visible lines below the cursor after scrolling
" set sidescrolloff=12    " The same for horizontal scrolling


" ***************************
" Configuration of coloscheme
" ***************************

set termguicolors   " Enables 24-bit RGB color

let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox


" ************
" Key mappings 
" ************

nnoremap <C-S> :NERDTreeToggle<CR>

nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-Q> :bd<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"


" *********
" Scenarios
" *********

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

