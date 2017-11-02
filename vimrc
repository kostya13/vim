"*** Установка конфига и Vundle:
"git clone https://bitbucket.org/kostya13/vim.git ~/.vim
"~/.vim/install_plug

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/occur.vim'
Plug 'majutsushi/tagbar'              " Class/module browser
Plug 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
"---------=== Code/project navigation ===-------------
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'              " Lean & mean status/tabline for vim
"Plug 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plug 'rosenfeld/conque-term'          " Consoles as buffers

"--------------=== Snippets support ===---------------
Plug 'SirVer/ultisnips'
"Plug 'garbas/vim-snipmate'        " Snippets manager
"Plug 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
"Plug 'tomtom/tlib_vim'        " dependencies #2
Plug 'honza/vim-snippets'     " snippets repo
"---------------=== Languages support ===-------------
" --- Python ---
Plug 'python-mode/python-mode'           " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plug 'davidhalter/jedi-vim'       " Jedi-vim autocomplete plugin
call plug#end()

"=====================================================
" Пути к плагинам, установленным вручную
set rtp+=~/.vim/plugins/nerdtree

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
set ttyfast
set cursorline

" включить подсветку кода
syntax on

if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=59 columns=235
  " прячем панельки
  set guioptions-=m   " меню
  set guioptions-=T    " тулбар
  "set guioptions-=r   "  скроллбары
  colorscheme morning
  "set guifont=Consolas:h13:cRUSSIAN
  "simalt ~x
  set cursorline
endif

tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb=
set novisualbell

"set enc=utf-8        " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch        " инкреминтируемый поиск
set hlsearch         " подсветка результатов поиска
set nu               " показывать номера строк
set scrolloff=3      " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

" настройка на Tab
set smarttab
set tabstop=4

" настройки Vim-Airline
set laststatus=2

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1


" NerdTree настройки
" показать NERDTree на F3
map <S-F3> :NERDTreeToggle<CR>
map <F3> :CtrlPRoot<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'



"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_trim_whitespaces = 1
"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = ['pyflakes', 'pep8']
"let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 1
let g:pymode_run_bind = '<F11>'

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 2
"=====================================================
" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit python3<CR>
" а debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermSplit python3 " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
<
" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>


"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with


set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251
let NERDTreeShowBookmarks=1

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

nnoremap <S-F12> :BufExplorer<CR>
inoremap <S-F12> <ESC>:BufExplorer<CR>
nnoremap <F12> :CtrlPBuffer<CR>
inoremap <F12> <ESC>:CtrlPBuffer<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
imap <F6> <ESC><C-w>w
map <F6>  <C-w>w
let g:airline#extensions#tabline#enabled = 0
set autoread
" diff win saved version
map <F8> :w !diff % - <CR>
set autochdir
map <Leader>b iimport pdb;pdb.set_trace()<ESC>
set makeprg=flake8
map <F5> :silent make %<CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
set hidden
set smartcase

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set shiftwidth=2
let g:ctrlsf_default_root = 'project'
map <Leader>- ct_
map <Leader>o o<ESC>
map <Leader>O O<ESC>
map <Leader>h :nohl<CR>
map <Leader>k i<CR><Esc>==
map <Leader>f !../../tests/formatcsv.py "%"
map <Leader>' ysiw'

"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set background=light
let g:ctrlp_by_filename = 1

"let g:ctrlp_custom_ignore = {'file': '\v(\.py|\.sql)@<!$'}

set wildignore=*.pyc

" Хоткеи для Git
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Git checkout
map <Leader>gcc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gdo :diffoff<CR>
map <Leader>gp :Gpush<CR>

" Хоткеи CtrlSF
map <Leader>s :CtrlSF 
map <Leader>ss :CtrlSF <CR>
map <Leader>sq :CtrlSFQuickfix 
 
" Настройки ultisnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" 
map <S-F4> :CtrlPBufTag<CR>
