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
    " Синтаксический анализ
    Plug 'vim-syntastic/syntastic'
    " Markdown предпросмотр
    Plug 'suan/vim-instant-markdown'
    " Автоматическое переключение раскладки при смене режимов
    Plug 'lyokha/vim-xkbswitch' 
    " Строка статуса
    Plug 'vim-airline/vim-airline'

call plug#end()
" ----------------------------



" ===== Глобальные Настройки =====
" --------------------------------

" Командная оболочка
set shell=/bin/zsh

" Скрывать буферы без необходимого сохранения
set hidden

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

" Меняем leader-клавишу
let mapleader=","

" Цветовая схема
colorscheme vim-sublime-monokai

" --------------------------------



" ===== Настройка сочетаний клавиш =====
" --------------------------------------

" Удаление без изменения буфера обмена
nnoremap <leader>d "_d

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

" Буферы вместо вкладок
nmap <leader>T :enew<cr>
nmap <leader>j :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Выход в нормальный режим по двойному ;;
inoremap ;; <Esc>

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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
map <C-b> :NERDTreeToggle<CR>

" Настройка Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Настройка Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

