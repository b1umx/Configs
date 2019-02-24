" Author: zer0phase

" ===== Список плагинов ======
" ----------------------------

call plug#begin()

    " Автодополнение 
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    " Плагины к автодополнению
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
    Plug 'ncm2/ncm2-tern'
    Plug 'ncm2/ncm2-jedi'
    " Дерево каталогов и файлов
    Plug 'scrooloose/nerdtree'
    Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()
" ----------------------------



" ===== Глобальные Настройки =====
" --------------------------------

" Командная оболочка
set shell=/bin/zsh

" Номера строк
set number

" Системный буфер обмена
set clipboard=unnamedplus

" Автоопределение типа файла
filetype plugin indent on

" Табуляция
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

" Цветовая схема
colorscheme vim-monokai-tasty 

" --------------------------------



" ===== Настройка сочетаний клавиш =====
" --------------------------------------

" Навигация по окнам
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Изменение размеров окон
nnoremap <C-Left> <C-W><
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+
nnoremap <C-Right> <C-W>>

" Выравнивание
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" --------------------------------------



" ===== Настройка сторонних плагинов =====
" ----------------------------------------

" Настройка автодополнения NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c

" Настройка NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0]
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
map <C-b> :NERDTreeToggle<CR>

