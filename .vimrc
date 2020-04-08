scriptencoding utf-8
set encoding=utf-8
" vim-bootstrap 

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

"let g:vim_bootstrap_langs = "python"
let $VIRTUAL_ENV = $CONDA_PREFIX
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

let lite = 0
let home_path = expand('~')
if home_path =~ "pengyu"
  let lite = 1
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

let $BASH_ENV = expand('~/.vim_bash_env')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'qpkorr/vim-bufkill'
"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'skywind3000/asyncrun.vim'

Plug 'ctrlpvim/ctrlp.vim'

if !lite
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-rsi'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'HansPinckaers/ncm2-jedi'

" for TypeScript
" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh; :UpdateRemotePlugins'}

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" Java
Plug 'artur-shaik/vim-javacomplete2'
au FileType java setlocal omnifunc=javacomplete#Complete
""To enable smart (trying to guess import option) inserting class imports with F4, add:
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
""To enable usual (will ask for import option) inserting class imports with F5, add:
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
""To add all missing imports with F6:
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
""To remove all unused imports with F7:
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" python
"" Python Bundle
Plug 'tmhedberg/SimpylFold'
Plug 'Chiel92/vim-autoformat'
"Plug 'goerz/jupytext.vim'
"Plug 'ivanov/vim-ipython'
"Plug 'cjrh/vim-conda'

" JS
Plug 'pangloss/vim-javascript'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-jedi'
    let g:deoplete#enable_at_startup = 1
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " For Denite features
  Plug 'Shougo/denite.nvim'
  Plug 'davidhalter/jedi-vim'
endif

Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" vuejs
"Plug 'posva/vim-vue'
"Plug 'leafOfTree/vim-vue-plugin'

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Use release branch (Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler				" 显示状态栏光标标尺
set cursorline				" 突出显示当前行
set number				" 显示行号
" 开启语法高亮显示，终端支持256色。
"syntax on
"set t_Co=256

let no_buffers_menu=1
set mousemodel=extend

" the following is for myself
set colorcolumn=80

"let no_buffers_menu=1

silent! colorscheme xcodedark

"set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

  
endif



"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

"set statusline=
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
"noremap n nzzzv
"nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'papercolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]

let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'

let g:airline#extensions#bookmark#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

let g:airline#extensions#ctrlp#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'insert' 
"let g:airline#extensions#ctrlp#color_template = 'normal'
"let g:airline#extensions#ctrlp#color_template = 'visual'
"let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1



"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
"cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev A !java org.antlr.v4.Tool -visitor %
cnoreabbrev G !java org.antlr.v4.gui.TestRig
cnoreabbrev B !javac %:t:r*.java
ca AB copen \| wincmd p \| AsyncRun java org.antlr.v4.Tool -visitor % && javac %:r*.java
cnoreabbrev J !java %:t:r

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
" nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e


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
autocmd FileType go let b:noNCM2=1

func! NCM2_enable()
  if exists('b:noNCM2')
    return
  endif
  call ncm2#enable_for_buffer()
endfunc
autocmd BufEnter * call NCM2_enable()
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
	"au BufEnter * silent! lcd %:p:h
endif
set autoread
" 启用VIM内置的man page reviewer，可以用命令`:Man XXX`查看手册页
runtime! ftplugin/man.vim
" ### }}} VIM 特性配置结束

" Show byte offset 
set statusline+=%o
" ALE linting events
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

if has('ale')
augroup ale
  autocmd!

  autocmd VimEnter *
    \ set updatetime=1000 |
    \ let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Queue(0)
  autocmd CursorHoldI * call ale#Queue(0)
  autocmd InsertEnter * call ale#Queue(0)
  autocmd InsertLeave * call ale#Queue(0)
augroup END
endif

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" format
noremap <F3> :Autoformat<CR>

"" Split
"noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
" Add Gadd
inoremap <silent> <Leader>ga <ESC> :silent !git add %<CR>
noremap <silent> <Leader>ga :silent !git add %<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gc :copen \| wincmd p \| AsyncRun git commit -sm<SPACE>
noremap <Leader>gca :Git commit --amend<CR>
noremap <silent> <Leader>gsh :copen \| wincmd p \| AsyncRun git -C %:p:h push<CR>
noremap <silent> <Leader>gll :copen \| wincmd p \| AsyncRun git -C %:p:h pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :GRemove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>cd :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  "if !exists(":Ag")
  "  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  "endif
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_layout = { 'window': 'enew' }

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>P "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
"noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>
inoremap <leader>c <ESC>:BD<CR>
noremap <leader>C :BD<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
"noremap <C-p> <C-w><C-p>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_command = ""
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0 " use deoplete-jedi for completions

" typescript related
let g:yats_host_keyword = 1

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1


:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1



" vuejs
" vim vue
let g:vue_disable_pre_processors=1
" vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" from https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
"
" More natural split opening
set splitbelow
set splitright

set autowrite

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nmap <Leader>. <C-^>

" Run commands that require an interactive shell
nnoremap <silent> <Leader>R :source ~/.vimrc<CR>


" Always use vertical diffs
if has('nvim')
    set diffopt+=vertical
endif


""" ### vim 特性配置 {{{
set nocompatible			" 不使用vi兼容模式
"set nonu
set relativenumber			" 显示相对（当前光标所在行）行号而不是绝对行号
set hlsearch				" 高亮搜索结果
set incsearch				" 输入搜索内容时就同步显示搜索结果
set ignorecase				" 搜索时大小写不敏感
set smartcase
set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile "undo !!!!!!!!!!!!!
set nowrap				" 长度超过窗口宽度不要换行显示
set list				" 让vim显示空格、tab、换行等不可见字符
set listchars=nbsp:¬,trail:·,tab:»·	" 设置vim把空格、换行、tab显示为什么字符
set gcr=a:blinkon0
set scrolloff=3				" 光标移动到顶部和底部时自动保持3行距离
"set showmatch				" 显示自动匹配到的对应括号
set showmode				" 让vim在窗口最低下显示当前模式，如--insert--等
set showcmd				" 在命令模式下输入命令时，同步显示已经键入的命令内容
set nobackup				" 保存文件时，不要创建备份文件
set textwidth=0				" 一行内输入字符达到多少时自动换行，0表示不限制
set history=500				" 记录的历史命令个数

set shiftwidth=4			" 设定vim的自动缩进，以及>和<命令时移动的空白长度
set softtabstop=0			" 按下tab时，插入的是空格和tab制表符的混合，具体方式参见:help softtabstop
set tabstop=4				" 设定tab长度为4字节
set expandtab				" 键入tab时，自动用空格替换tab，空格长度等于tabstop的设置

set backspace=indent,eol,start		" 退格键（backspace）默认工作vi模式下。该设置可以让退格键工作在大家熟悉的方式下。
					" indent: 如果设置了:set indent等自动缩进，按退格键会删掉这个缩进。
					" eol: 如果插入模式下在行开头，设置了eol后按下退格键会合并到上一行。
					" start: 若不设置为start，则在回退时，只能回退删除自己新添加的字符，原来已经存在的字符无法回退删除。
" set pastetoggle=<f3>			" 按下f3键可以切换粘贴插入模式[insert (paste)]和普通插入模式。

" easy motion
"map <Leader><Leader> <Plug>(easymotion-prefix)


"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" mouse
set mouse=nv

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>


" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:SimpylFold_docstring_preview = 1

" swith between python and ipynb filetype
" noremap <Leader>p :set filetype=python<CR>
"noremap <Leader>j :set filetype=ipynb<CR>  # always called by accident

let g:python3_host_prog = $CONDA_PREFIX . "/bin/python"
let g:python_host_prog = '/Users/v/anaconda3/envs/ipod/bin/python'
"let g:python_host_prog = '/Users/v/anaconda3/envs/torch/bin/python3'
"let g:python_host_prog = '/usr/bin/python'
"let g:python_host_prog = $CONDA_PREFIX . "/bin/python"

"set fillchars=stl:^,stlnc:=,vert:│,fold:·,diff:-
"noremap <Leader>x :bunload<CR>

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")
noremap <Leader>bs :Bs

" Customized mapping...
"vnoremap jk <ESC>
"vnoremap fd <ESC>
inoremap jk <ESC>
inoremap fd <ESC>
inoremap <C-z> <ESC>
noremap \ :Rg<SPACE>
inoremap <Leader>s <ESC>:w<CR>
inoremap <Leader>ss <C-O>:w<CR>
inoremap <silent> <Leader>S <ESC>:silent wq<CR><CR>
noremap <Leader>s :<C-U>w<CR>
noremap <silent> <Leader>S :<C-U>silent wq<CR><CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>rg       :Rg <C-R><C-W><CR>
xnoremap <silent> <leader>rg       y:Rg <C-R><C-W><CR>

if !lite
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt plugin[mappings]
call glaive#Install()

let gjf = expand('~/bin/google-java-format-1.7-all-deps.jar')
if !filereadable(gjf)
    let gje = 'Glaive codefmt google_java_executable='. "\"java -jar " . gjf . "\""
    execute gje
endif
endif

nnoremap <silent> <Leader>= :FormatCode<CR>
imap <C-w> <C-o><C-w>
noremap <M-<> <C-W><
noremap <M->> <C-W>>

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

set pastetoggle=<F6>

" formatter
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

let g:go_info_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_referrers_mode = 'gopls'

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go let g:jedi#documentation_command = ""
  au FileType go nnoremap <silent>K :GoDoc <BAR> wincmd p<CR>
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

let g:go_doc_popup_window = 0
let g:go_doc_keywordprg_enabled = 1
" ale
call extend(g:ale_linters, {
    \"go": ['golint', 'gopls', 'go vet'], })

"let g:LanguageClient_serverCommands = {
"    \ 'go': ['gopls']
"    \ }


"" Include user's local vim config
if filereadable(expand("~/.rc.local"))
  source ~/.rc.local
endif

nnoremap <Leader>a :copen <BAR> wincmd p <BAR> AsyncRun<SPACE>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

"" if hidden is not set, TextEdit might fail.
"set hidden
"" Better display for messages
"set cmdheight=2
"" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"" always show signcolumns
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use U to show documentation in preview window
"nnoremap <silent> U :call <SID>show_documentation()<CR>
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"" disable vim-go :GoDef short cut (gd)
"" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0
"
"nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <leader>fr :call LanguageClient_textDocument_references()<CR>
"nnoremap <silent> <leader>ren :call LanguageClient_textDocument_rename()<CR>
"nnoremap <silent> <leader>m :call LanguageClient_contextMenu()<CR>

" for complition
" neocomplete like
" deoplete.nvim recommend
" added for ncm2
set completeopt=noinsert,noselect,menuone
" deoplete-go settings
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gopls'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

nnoremap <silent><Leader>m :make<CR>
nnoremap <silent><Leader>E :e ~/.vimrc<CR>
noremap <silent><Leader>p :<C-u>wincmd p<CR>

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"let g:jedi#force_py_version = 2  " conda plugin recommend
let g:UltisnipsUsePythonVersion = 2
let g:conda_startup_msg_suppress = 1

" other ncm2 settings
set shortmess+=c
inoremap <c-c> <ESC>
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

tnoremap <Esc> <C-\><C-n>
set lazyredraw
