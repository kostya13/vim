"*** Установка конфига и Vundle:
"git clone https://bitbucket.org/kostya13/vim.git ~/.vim
"~/.vim/install_vundle

"syn on
"set noerrorbells visualbell t_vb=
"if has('autocmd')
"  autocmd GUIEnter * set visualbell t_vb=
"endif

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim
"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required
Bundle 'flazz/vim-colorschemes' 
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dyng/ctrlsf.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/occur.vim'
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
Plugin 'rking/ag.vim'
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'        " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'        " dependencies #2
Plugin 'honza/vim-snippets'     " snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'           " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'       " Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'


call vundle#end()                   " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
source $VIMRUNTIME/mswin.vim
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
  " прячем панельки
  set guioptions-=m   " меню
  set guioptions-=T    " тулбар
  "set guioptions-=r   "  скроллбары
endif
set ttyfast

colorscheme wombat
" включить подсветку кода
syntax on
if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=59 columns=235
  colorscheme jellybeans
  "set guifont=Consolas:h13:cRUSSIAN
  "simalt ~x
  set cursorline  
endif
"au GUIEnter * simalt ~x

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
set scrolloff=5      " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

" настройка на Tab
set smarttab
set tabstop=4

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
"let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии
let g:tagbar_autoclose = 1 
let g:tagbar_compact = 1 


" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
map <S-F3> :NERDTreeFind<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'

" TaskList настройки
"map <F2> :TaskList<CR>     " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR>      " CTRL+Q - закрыть текущий буффер
 
"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_trim_whitespaces = 1

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = ['pyflakes' , 'pep8']
"let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
"let g:pymode_virtualenv = 1

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

" переключение между синтаксисами
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251
let g:tagbar_compact = 1
let NERDTreeShowBookmarks=1

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <S-F12> :b <C-Z>
nnoremap <F12> :BufExplorer<CR>
inoremap <F12> <ESC>:BufExplorer<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
imap <F6> <ESC><C-w>w
map <F6>  <C-w>w
let g:airline#extensions#tabline#enabled = 0
set autoread
" diff win saved version
map <F8> :w !diff % - <CR>
" let g:netrw_home = 'D:\\home\\kostya\\.vim'
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
