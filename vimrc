"=====================================================
" Настройки папок с плагинами
"=====================================================
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

"set rtp+=~/.vim

"set rtp+=~/.vim/plugins/ctrlp
"set rtp+=~/.vim/plugins/ctrlsf
"set rtp+=~/.vim/plugins/ctrlsf/after
"set rtp+=~/.vim/plugins/jedi-vim
"set rtp+=~/.vim/plugins/jedi-vim/after
"set rtp+=~/.vim/plugins/nerdcommenter
"set rtp+=~/.vim/plugins/nerdtree
"set rtp+=~/.vim/plugins/python-mode
"set rtp+=~/.vim/plugins/python-mode/after
"set rtp+=~/.vim/plugins/tagbar
"set rtp+=~/.vim/plugins/vim-surround
"set rtp+=~/.vim/plugins/ultisnips
"set rtp+=~/.vim/plugins/ultisnips/after
"set rtp+=~/.vim/plugins/vim-fugitive
"set rtp+=~/.vim/plugins/Jenkinsfile-vim-syntax

"=====================================================
" Настройки редактoра
"=====================================================

set nocompatible " be iMproved
syntax on " включить подсветку кода
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup
set ruler
set completeopt-=preview
set gcr=a:blinkon0
set ttyfast
"set cursorline

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

set shiftwidth=2
set laststatus=2

set autoread

set wildignore=*.pyc
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
set hidden
set smartcase
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan
set background=dark
"set background=light

colorscheme myindustry
"colorscheme wombat

if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=59 columns=235
  " прячем панельки
  set guioptions-=m   " меню
  set guioptions-=T    " тулбар
  "set guioptions-=r   "  скроллбары
  "set guifont=Consolas:h13:cRUSSIAN
  "simalt ~x
  set cursorline
endif
"=====================================================
" Настройки плагинов
"=====================================================
""" TagBar
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1

""" Netrw
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'
 
""" NerdTree 
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '__pycache__']
let NERDTreeShowBookmarks=1


""" Python mode
let g:pymode_trim_whitespaces = 1
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 1
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
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" отключить autofold по коду
let g:pymode_folding = 0
let g:pymode_paths = ['/opt/jenkins/build/mfix_perf_tests', '/opt/jenkins/build/mfix_perf_tests/pypy3/site-packages']

""" Jedi
" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 2

" CtrlSF
let g:ctrlsf_default_root = 'project'
let g:ctrlp_root_markers = ['.ropeproject']

" CtrlP
let g:ctrlp_by_filename = 1
"let g:ctrlp_custom_ignore = {'file': '\v(\.py|\.sql)@<!$',
let g:ctrlp_custom_ignore = {'dir': 'pypy3'}
 
" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Rope
let g:ropevim_goto_def_newwin=''
"=====================================================
" Авто команды
"=====================================================
" autocmd FileType * call UltiSnips_FileTypeChanged()

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
autocmd FileType python map <Leader>b iimport pdb;pdb.set_trace()<ESC>
autocmd FileType python map <Leader>f iimport from .. import fpdb; fpdb().set_trace()  # XXX BREAKPOINT
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufReadPost *.fugitiveblame setfiletype fugitiveblame
"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
 
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"=====================================================
" Горячие главиши
"=====================================================

" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

map <F4> :TagbarToggle<CR>
map <Leader><F4> :CtrlPBufTag<CR>
 
" CtrlSF
map <Leader>s :CtrlSF 
map <Leader>ss :CtrlSF <CR>
map <Leader>sq :CtrlSFQuickfix 
 
" Git (Figutive)
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Git checkout
map <Leader>gcc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gdo :diffoff<CR>
map <Leader>gp :Gpush<CR>

"  Просмотр файлов
map <Leader><F3> :NERDTreeToggle<CR>
map <F3> :CtrlPRoot<CR>

" Просмотр буферов
nnoremap <F12> :CtrlPBuffer<CR>
inoremap <F12> <ESC>:CtrlPBuffer<CR>

" Сохранение
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" Работа с окнами
imap <F6> <ESC><C-w>w
map <F6>  <C-w>w
map <Leader>q <C-w>c

" Редактирование
" Заменить текст до ближайшего подчеркивания
map <Leader>- ct_
map <Leader>o o<ESC>
map <Leader>O O<ESC>

map <Leader>h :nohl<CR>
map <Leader>k i<CR><Esc>==
map <Leader>' ysiw'
" diff win saved version
map <F8> :w !diff % - <CR>

