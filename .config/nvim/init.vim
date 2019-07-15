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
    " Markdown синтаксис и пр. плюшки
    Plug 'plasticboy/vim-markdown'
    " Markdown предпросмотр
    Plug 'suan/vim-instant-markdown'
    " Автоматическое переключение раскладки при смене режимов
    Plug 'lyokha/vim-xkbswitch' 
    " Строка статуса
    Plug 'vim-airline/vim-airline'
    " Панель тегов (языковых сущностей) файла
    Plug 'majutsushi/tagbar'
    " Панель тегов (языковых сущностей) файла
    Plug 'Raimondi/delimitMate'
    " Language Server Protocol
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

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

" Подсветка текущей строки
set cursorline

" Подсветка ограничителя длины строки
set colorcolumn=121

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

" Выход из режима терминала
tnoremap <Esc> <C-\><C-N>

" Создание и закрытие окон
nnoremap <A-v> <C-W>v
nnoremap <A-s> <C-W>s
nnoremap <A-q> <C-W>q
inoremap <A-v> <C-\><C-N><C-W>v
inoremap <A-s> <C-\><C-N><C-W>s
inoremap <A-q> <C-\><C-N><C-W>q
tnoremap <A-v> <C-\><C-N><C-W>v
tnoremap <A-s> <C-\><C-N><C-W>s
tnoremap <A-q> <C-\><C-N><C-W>q

" Навигация по окнам
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>
inoremap <A-j> <C-\><C-N><C-W><C-J>
inoremap <A-k> <C-\><C-N><C-W><C-K>
inoremap <A-l> <C-\><C-N><C-W><C-L>
inoremap <A-h> <C-\><C-N><C-W><C-H>
tnoremap <A-j> <C-\><C-N><C-W><C-J>
tnoremap <A-k> <C-\><C-N><C-W><C-K>
tnoremap <A-l> <C-\><C-N><C-W><C-L>
tnoremap <A-h> <C-\><C-N><C-W><C-H>

" Изменение размеров окон
nnoremap <A-Left> <C-W><
nnoremap <A-Down> <C-W>-
nnoremap <A-Up> <C-W>+
nnoremap <A-Right> <C-W>>

" Выравнивание
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" Буферы вместо вкладок
nmap <leader>n :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>1 :b 1<CR>
nmap <leader>2 :b 2<CR>
nmap <leader>3 :b 3<CR>
nmap <leader>4 :b 4<CR>
nmap <leader>5 :b 5<CR>
nmap <leader>6 :b 6<CR>
nmap <leader>7 :b 7<CR>
nmap <leader>8 :b 8<CR>
nmap <leader>9 :b 9<CR>
nmap <leader>q :bp <BAR> bd #<CR>

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
let g:airline_powerline_fonts = 1

" Сочетание клавиш для вкл/откл Tagbar
nmap <F8> :TagbarToggle<CR>

" Настройка vim-markdown
let g:vim_markdown_folding_disabled = 1

" Настройка LSP для языков
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
let g:LanguageClient_changeThrottle = 0.1
let g:LanguageClient_autoStart = 1

