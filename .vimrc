" VIM 配置（终端环境）
" Iceway Zhang 
" Updated by Pengyu Zhou
" {vim:set shiftwidth=4 tabstop=4 softtabstop=4 expandtab:} "

""" ### VIM 特性配置 {{{
"set nocompatible			" 不使用vi兼容模式

set ruler				" 显示状态栏光标标尺
set cursorline				" 突出显示当前行
set number				" 显示行号
"set relativenumber			" 显示相对（当前光标所在行）行号而不是绝对行号
set hlsearch				" 高亮搜索结果
set incsearch				" 输入搜索内容时就同步显示搜索结果
set ignorecase				" 搜索时大小写不敏感
set smartcase
set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile "undo !!!!!!!!!!!!!
"set nowrap				" 长度超过窗口宽度不要换行显示
"set list				" 让VIM显示空格、tab、换行等不可见字符
"set listchars=nbsp:¬,trail:·,tab:»	" 设置VIM把空格、换行、tab显示为什么字符
set gcr=a:blinkon0
set scrolloff=3				" 光标移动到顶部和底部时自动保持3行距离
set showmatch				" 显示自动匹配到的对应括号
set showmode				" 让VIM在窗口最低下显示当前模式，如--INSERT--等
set showcmd				" 在命令模式下输入命令时，同步显示已经键入的命令内容
set nobackup				" 保存文件时，不要创建备份文件
set textwidth=0				" 一行内输入字符达到多少时自动换行，0表示不限制
set history=500				" 记录的历史命令个数

set shiftwidth=4			" 设定VIM的自动缩进，以及>和<命令时移动的空白长度
set softtabstop=0			" 按下tab时，插入的是空格和tab制表符的混合，具体方式参见:help softtabstop
set tabstop=4				" 设定tab长度为4字节
set expandtab				" 键入tab时，自动用空格替换tab，空格长度等于tabstop的设置

set backspace=indent,eol,start		" 退格键（backspace）默认工作vi模式下。该设置可以让退格键工作在大家熟悉的方式下。
					" indent: 如果设置了:set indent等自动缩进，按退格键会删掉这个缩进。
					" eol: 如果插入模式下在行开头，设置了eol后按下退格键会合并到上一行。
					" start: 若不设置为start，则在回退时，只能回退删除自己新添加的字符，原来已经存在的字符无法回退删除。
" set pastetoggle=<F3>			" 按下F3键可以切换粘贴插入模式[Insert (paste)]和普通插入模式。

" 开启语法高亮显示，终端支持256色。
syntax on
set t_Co=256

let no_buffers_menu=1
set mousemodel=extend
" 设置色彩空间为暗色调，使用solarized配色方案
set background=dark

" the following is for myself
set colorcolumn=72
set listchars=eol:\$,tab:>-
set nolist

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set viminfo='100,f1,<500
set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

cmap w!! w !sudo tee > /dev/null %

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Qall qall
cnoreabbrev Qa! qa!
cnoreabbrev Qa qa
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" 不重启VIM，让配置文件保存后立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

if has('autocmd')
	function! GnuIndent()
		setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
		setlocal shiftwidth=2
		setlocal tabstop=8
	endfunction

	if $VIM_HATE_SPACE_ERRORS != '0'
		let c_space_errors=1
	endif
	au FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4
	au FileType diff setlocal shiftwidth=4 tabstop=4
	au FileType sh setlocal tabstop=4
	au BufEnter /usr/include/* setf c
	au BufEnter /usr/* call GnuIndent()
	"autocmd BufEnter * silent! lcd %:p:h
endif
set autoread
" 启用VIM内置的man page reviewer，可以用命令`:Man XXX`查看手册页
runtime! ftplugin/man.vim
" ### }}} VIM 特性配置结束

" Show byte offset 
set statusline+=%o

" writes the content of the file automatically if you call :make
set autowrite 

" ############################################################################ "
" ###############     VIM插件：使用Vundle.vim 管理插件     ################### "
" ############################################################################ "
" {{{ Vundle Setting
" Vundle必须：先关闭兼容模式及文件类型检测
set nocompatible
filetype off

" refer to http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"let iCanHazVundle=1
"let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
"if !filereadable(vundle_readme)
"    echo "Installing Vundle..."
"    echo ""
"    silent !mkdir -p ~/.vim/bundle/
"    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"    let iCanHazVundle=0
"endif
"
"" 设置包括vundle和初始化相关的runtime path
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin('~/.vim/bundle/')
"
"" Vundle必须：让vundle管理插件版本
"Plugin 'scrooloose/nerdtree'
"Plugin 'nerdtree-ack'
"Plugin 'VundleVim/Vundle.vim'
"
"Plugin 'altercation/vim-colors-solarized'
"	let g:solarized_termcolors=256
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'tomasr/molokai'
"Plugin 'taglist.vim'
"	map <F2> :silent! Tlist<CR>
"	let Tlist_Ctags_Cmd='ctags'
"	let Tlist_Exit_OnlyWindow=1
"Plugin 'scrooloose/syntastic'
"        "set statusline+=%#warningmsg#
"	"set statusline+=%{SyntasticStatuslineFlag()}
"	"set statusline+=%*
"	let g:syntastic_error_symbol='✗'
"	let g:syntastic_warning_symbol='⚠'
"	let g:syntastic_check_on_open=0
"	let g:syntastic_check_on_wq=1
"	let g:syntastic_auto_loc_list=1
"Plugin 'EasyMotion'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'vim-airline/vim-airline'
"	set noshowmode
"	set laststatus=2
"	let g:airline_theme='powerlineish'
"	let g:airline_powerline_fonts = 1
"	let g:airline_detect_whitespace = 1
"	let g:airline#extensions#tabline#enabled = 1
"	let g:airline#extensions#hunks#non_zero_only = 1
"
"	let g:airline_powerline_fonts = 1
"
"	if !exists('g:airline_symbols')
"	    let g:airline_symbols = {}
"	endif
"	let g:airline_left_sep = "\ua0"
"	let g:airline_left_alt_sep = "\ua0"
"	let g:airline_right_sep = "\ua0"
"	let g:airline_right_alt_sep = "\ua0"
"	let g:airline_symbols.maxlinenr = '㏑'
"	"let g:airline_symbols.linenr = '␊'
"	let g:airline_symbols.linenr = '␤'
"	"let g:airline_symbols.linenr = '¶'
"	let g:airline_symbols.branch = '⎇'
"	let g:airline_symbols.paste = 'ρ'
"	"let g:airline_symbols.paste = 'Þ'
"	"let g:airline_symbols.paste = '∥'
"	let g:airline_symbols.whitespace = 'Ξ'
"	let g:airline_symbols.space = "\ua0"
"	let g:airline_symbols.spell = 'Ꞩ'
"	let g:airline_symbols.notexists = '∄'
"	let g:airline_symbols.readonly = "\ua0"
"
"Plugin 'ctrlp.vim'
"	let g:ctrlp_follow_symlinks=1
"	let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'tpope/vim-fugitive'
"Plugin 'lilydjwg/colorizer'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"	let g:deoplete#enable_at_startup = 1
"
"" 安装了Vundle后，首次自动安装插件
"if iCanHazVundle == 0
"    echo "Installing plugins, please ignore key map error messages"
"    echo ""
"    :PluginInstall
"endif
"
"" 你的所有插件需要在下面这行之前
"call vundle#end()
" Vundle必须：加载vim自带和插件相应的语法和文件类型相关脚本
" }}} End of Vundle Setting
call plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
call plug#end()
"Plugin 'taglist.vim'
"	map <F2> :silent! Tlist<CR>
"	let Tlist_Ctags_Cmd='ctags'
"	let Tlist_Exit_OnlyWindow=1
"Plugin 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'
	let g:syntastic_check_on_open=0
	let g:syntastic_check_on_wq=1
	let g:syntastic_auto_loc_list=1
"Plugin 'EasyMotion'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'vim-airline/vim-airline'
"	set noshowmode
"	set laststatus=2
"	let g:airline_theme='powerlineish'
"	let g:airline_powerline_fonts = 1
"	let g:airline_detect_whitespace = 1
"	let g:airline#extensions#tabline#enabled = 1
"	let g:airline#extensions#hunks#non_zero_only = 1
"
"	let g:airline_powerline_fonts = 1
"
"	if !exists('g:airline_symbols')
"	    let g:airline_symbols = {}
"	endif
"	let g:airline_left_sep = "\ua0"
"	let g:airline_left_alt_sep = "\ua0"
"	let g:airline_right_sep = "\ua0"
"	let g:airline_right_alt_sep = "\ua0"
"	let g:airline_symbols.maxlinenr = '㏑'
"	"let g:airline_symbols.linenr = '␊'
"	let g:airline_symbols.linenr = '␤'
"	"let g:airline_symbols.linenr = '¶'
"	let g:airline_symbols.branch = '⎇'
"	let g:airline_symbols.paste = 'ρ'
"	"let g:airline_symbols.paste = 'Þ'
"	"let g:airline_symbols.paste = '∥'
"	let g:airline_symbols.whitespace = 'Ξ'
"	let g:airline_symbols.space = "\ua0"
"	let g:airline_symbols.spell = 'Ꞩ'
"	let g:airline_symbols.notexists = '∄'
"	let g:airline_symbols.readonly = "\ua0"
"
"Plugin 'ctrlp.vim'
"	let g:ctrlp_follow_symlinks=1
"	let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'tpope/vim-fugitive'
"Plugin 'lilydjwg/colorizer'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
filetype plugin indent on

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" key mappings                           
nmap <F3> :set list<CR>
nmap <Leader><F3> :set nolist<CR>
" Key mapping to stop the search highlight
nmap <silent> <F4>      :nohlsearch<CR>
imap <silent> <F4> <C-O>:nohlsearch<CR>
" Key mapping for the taglist.vim plugin
" nmap <F9>      :Tlist<CR>
" imap <F9> <C-O>:Tlist<CR>
" Key mappings for the quickfix commands
nmap <F11> :cn<CR>
nmap <F12> :cp<CR>

" Find match name in Project
nmap <F6> ebye<C-W>t\g<C-R>0<CR><C-L>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h


let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_File_Fold_Auto_Close=1


if has("cscope")
	set csprg=cscope

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif
	
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB !=""
		cs add $CSCOPE_DB
	endif
	set csverb
"	set path+=/home/pengyu.zhou/works/git_repos/gaming_router-buildroot/build_dir/linux-ipq806x/linux-3.4.103/source/include

	"nmap <Leader>a :cs add cscope.out<CR>
	nmap <Leader>a :cs find a <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	" nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <Leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <Leader>ss :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>sg :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>sc :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>st :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>se :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>sf :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <Leader>si :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <Leader>sd :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <Leader>vs
	    \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>vg
	    \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>vc
	    \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>vt
	    \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>ve
	    \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>vi
	    \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <Leader>vd
	    \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

set mouse=""
ab csf cs find
ab csfg cs find g
ab csfc cs find c
ab csfs cs find s
ab csft cs find t


""" other mappings
" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
" deoplete-go
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/Users/vincent/bin/anaconda3/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = '/Users/vincent/works/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0

let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_decls_includes = "func,type"
" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDecls<cr>
nmap <C-G> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" tagbar, for go
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
    \ }

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <Leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <Leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <Leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" easy motion
map <Leader><Leader> <Plug>(easymotion-prefix)

" others...
inoremap jk <ESC>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

colorscheme torte
