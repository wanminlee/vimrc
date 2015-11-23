"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    自用Vim配置文件
"       简单、实用  :)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  判断操作系统
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " not support VI
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugins

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
" Visually display indent levels in Vim   colors
Plugin 'nathanaelkane/vim-indent-guides'
" Displays tags in a window, ordered by class etc, i used it instead of taglist
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

"singlecompile using one key
Plugin 'xuhdev/SingleCompile'
"show whitespace   delete call :fixwhitespace
Plugin 'bronson/vim-trailing-whitespace'
"comment in a easy way  \cc \cu   like c.vim
Plugin 'scrooloose/nerdcommenter'
" tabular /|
Plugin 'godlygeek/tabular'

"  show tab c-a  like \be  d: delete buf
Plugin 'szw/vim-ctrlspace'
"search files  c-p
Plugin 'kien/ctrlp.vim'
"fast to get      \w  \f
Plugin 'Lokaltog/vim-easymotion'
" marks ma create a   'a goto a   m- delete
Plugin 'kshenoy/vim-signature'

" Deal with pairs of punctuations such as (), [], {}, and so on
Plugin 'kana/vim-smartinput'
""" syntax highlight and complete
"Syntax check that runs files through external syntax checkers
Plugin 'scrooloose/syntastic'

" c++ IDE
Plugin 'c.vim'
"syntax c++ and qt
Plugin 'cpp.vim--Skvirsky'
" Improved C++ STL syntax highlighting
Plugin 'STL-Syntax'
Plugin 'STL-improved'

"Python
" Tab 补全
Plugin 'rkulla/pydiction'
" Highlight
Plugin 'hdima/python-syntax'
" doc lin  syn  check need compiled with python+ windows只支持到32
"Plugin 'klen/python-mode'

" HTML 高亮
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nono/jquery.vim'
Plugin 'elzr/vim-json'
"xml html 补全
Plugin 'docunext/closetag.vim'
"html xml ...  cs  repeate
Plugin 'tpope/vim-surround'

let useneocomplete = 0
if g:iswindows
    " Ultimate auto completion system for Vim
    Plugin 'Shougo/neocomplete.vim'
    let useneocomplete = 1
else
    " YCM need compile
    Plugin 'Valloric/YouCompleteMe'
endif

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on   " required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,utf-16
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  基础设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500                     " 保留历史记录
set nocompatible                    "设置不兼容 VI
set autoread                        "文件修改后自动载入

"备份相关
set nobackup                        " 设置不生成备份文件
"set backup
"下面两行改变备份文件存放路径
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup
"set backupext=.bak

"set mps+=<:>      " 让<>可以使用%跳转
set lazyredraw    " do not redraw while executing macros (much faster)
" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=

" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

"智能文内搜素提示
set ignorecase " 搜索时忽略大小写
set smartcase  " 保持字符串的内容，替换字符串的大小写风格.
set incsearch  " 随着键入及时搜索
set hlsearch   " 高亮search命中的文本
set mouse=a    " 所有模式鼠标可用
set autochdir  " 自动切换当前目录为当前文件所在的目录

set title
"去掉错误提示音
set visualbell      "会闪屏
set noerrorbells
set noeb

set confirm         "处理未保存的文件需要确认"
set noswapfile      "不生成swap文件"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  展示/排版等界面格式设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI  " 启动不显示索马里儿童提示
set t_Co=256       " Use 256 colors
set number         " 显示行号
"set relativenumber " 显示相对行号
"突出显示当前行
"set cursorcolumn
set cursorline

" set list "设置末尾为 $  提示
" set listchars=tab:\|\ , 显示Tab符，使用一高亮竖线代替

" 自动缩进
set smartindent
set autoindent

"代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent         " set default foldmethod

"Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab     " 使用空格替换Tab

" always have status-line'
set laststatus=2

"set ruler
set showcmd               " 在状态栏显示正确输入命令
set showmode              " show current mode
set showmatch             " 括号配对

set scrolloff=4           " 在光标接近底端或顶端时，自动下滚或上滚
set shiftround            " use multiple of shiftwidth when indenting with '<' and '>'
set hidden                " allow to change buffer without saving
set ttyfast
set nowrap                " 设置不自动换行
"set whichwrap+=<,>,h,l
"set linebreak     " 整词换行，与自动换行搭配使用

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  其他配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows
"autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux
autocmd BufRead,BufNewFile *.xaml :set filetype=xml
autocmd BufRead,BufNewFile *.cshtml :set filetype=html

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

set wildmenu  " 增强模式中的命令行自动完成操作
"set wildmode=list:longest
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
"set backspace=2   " 设置退格键可用
set backspace=eol,start,indent

"--------------------------------------------------
" => hot key
"--------------------------------------------------
" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj
"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"nmap <silent> <Leader>pf :e d:\Personal\ Files\reminder<CR>

"inoremap kj <Esc>
" Go to home and end using capitalized directions
noremap <C-e> $

"--------------------------------------------------
" => ctags
"--------------------------------------------------
" open ctags entries in a new tab
set tags=tags;/
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
"nnoremap <silent> <F3> :Grep<CR>

"--------------------------------------------------
" => neocomplete
"--------------------------------------------------
if useneocomplete

    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

endif
"--------------------------------------------------
" => NERDTree options   Tagbar options
"--------------------------------------------------
" Auto change the root directory
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 24
let g:tagbar_width = 24
let g:tagbar_left = 1

function! ToggleTagBar()
    let w:jumpbacktohere = 1
    let tagbar_open = bufwinnr('__Tagbar__') != -1
    if tagbar_open
        TagbarClose
    else
        TagbarOpen
    endif
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

function! ToggleNERDTree()
    let w:jumpbacktohere = 1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    if nerdtree_open
        NERDTreeClose
    else
        NERDTree
    endif
    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

nmap <F7> :call ToggleTagBar()<CR>
nmap <F8> :call ToggleNERDTree()<CR>
"nmap <F7> :call ToggleNERDTreeAndTagbar()<CR>

"--------------------------------------------------
" => Syntastic
"--------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_python_python_exec =
"--------------------------------------------------
" => Python
"--------------------------------------------------
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 6

""Python-mode
"" Load show documentation plugin
"let g:pymode_doc = 1
"" Key for show python documentation
"let g:pymode_doc_key = 'K'
"" Load run code plugin   we have singlecompile
"let g:pymode_run = 0
"" Key for run python code
""let g:pymode_run_key = '<leader>r'
""Pymode pylint  0 is diable
"let g:pymode_lint=1
""let g:pymode_lint_checker="pyflakes,mccabe"
"let g:pymode_lint_checkers = ['pyflakes', 'mccabe', 'pep8']
""let g:pymode_lint_ignore="E2,W"
""auto-checking on every save is disabled.
""let g:pymode_lint_write=0
""
"let g:pymode_virtualenv = 0
""Trun off the rope script
"let g:pymode_rope = 0

""enable breakpoint
"let g:pymode_breakpoint=1
"let g:pymode_breakpoint_key='<leader>b'

"--------------------------------------------------
" => single compile
"--------------------------------------------------
nmap <F5> :SCCompile<cr>
nmap <F6> :SCCompileRun<cr>
"let g:SingleCompile_usequickfix = 0

"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_clear_cache_on_exit=0
"let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
"let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------

if has('gui_running')
    let g:indent_guides_auto_colors = 1
    set ts=4 sw=4 et
else
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=dark   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=dark   ctermbg=3
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1

"--------------------------------------------------
" =>  tabular
"--------------------------------------------------
" auto | tabular
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"function! s:align()
  "let p = '^\s*|\s.*\s|\s*$'
  "if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    "let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    "let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    "Tabularize/|/l1
    "normal! 0
    "call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  "endif
"endfunction
"--------------------------------------------------
" =>  easymotion
"--------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
"--------------------------------------------------
" => vim-ctrlspace
"--------------------------------------------------
let g:CtrlSpaceUseTabline = 0
let g:ctrlspace_default_mapping_key = "<C-a>"
:map <C-a>  :CtrlSpace<CR>
"--------------------------------------------------
" =>  Custom KEY
"--------------------------------------------------
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" Full Window
map <silent> <F11> :only<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if g:iswindows           "Windows设置可以进行C-C 和C-V
    "source $VIMRUNTIME/mswin.vim
    "behave mswin
    "set diffexpr=MyDiff()
    "function MyDiff()
        "let opt = '-a --binary '
        "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        "let arg1 = v:fname_in
        "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        "let arg2 = v:fname_new
        "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        "let arg3 = v:fname_out
        "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        "let eq = ''
        "if $VIMRUNTIME =~ ' '
          "if &sh =~ '\<cmd'
            "let cmd = '""' . $VIMRUNTIME . '\diff"'
            "let eq = '"'
          "else
            "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
          "endif
        "else
          "let cmd = $VIMRUNTIME . '\diff'
        "endif
        "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    "endfunction
"endif

if has('gui_running')
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_italic =  0
    set lines=36 columns=130 " 设置窗口大小
    "set showtabline=2        " 设置显示标签栏  GUI
    "set guioptions-=T        " 取消菜单栏 GUI
    "au GUIEnter * simalt ~x  " WINDOWS下全屏

    if g:iswindows
        set guifont=Consolas:h12:b:cANSI    " 字体设置  windows
    else
        set guifont=FreeMono\ Bold\ 12      " linux
    endif
else
    set background=dark
    colorscheme molokai
    let g:molokai_original=1
    let g:rehash256=1
endif

syntax enable                    " 打开语法高亮
syntax on
"--------------------------------------------------
" =>  END
"--------------------------------------------------
