call plug#begin('~/.vim/plugged')
"
" always enabled
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
"Plug 'myint/syntastic-extras'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
"Plug 'Shougo/vimproc.vim', {'do': 'make'}
"Plug 'docunext/closetag.vim'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'tomtom/quickfixsigns_vim'
"Plug 'Valloric/YouCompleteMe', {'do': './install.sh', 'frozen': 'true'}
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'ervandew/supertab'
"Plug 'Rykka/InstantRst'
"Plug 'vimwiki/vimwiki'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'dense-analysis/ale'
"Plug 'yssl/QFEnter'

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-scripts/taglist.vim'
"Plug 'tpope/vim-repeat'
"Plug 'godlygeek/tabular'
"Plug 'Shougo/unite.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-endwise'
"Plug 'jiangmiao/auto-pairs'
"Plug 'Valloric/MatchTagAlways'
"Plug 'majutsushi/tagbar'
"Plug 'liuchengxu/vista.vim'
"Plug 'terryma/vim-expand-region'
"Plug 'Yggdroot/indentLine'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" on-demand loading
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'xolox/vim-notes', {'on': 'Notes'}
Plug 'chrisbra/NrrwRgn', {'on': 'NrrwRgn'}
Plug 'mtth/scratch.vim', {'on': 'Scratch'}
Plug 'mattn/gist-vim', {'on': 'Gist'}
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}

" filetype specific plugins
Plug 'lervag/vimtex', {'for': ['tex']}
"Plug 'othree/html5.vim', {'for': ['html']}
"Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
"Plug 'pangloss/vim-javascript', {'for': ['javascript']}
"Plug 'itspriddle/vim-jquery', {'for': ['javascript']}
"Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
"Plug 'fs111/pydoc.vim', {'for': 'python'}
"Plug 'rhysd/vim-clang-format', {'for': 'cpp'}

call plug#end()

" General {

    filetype plugin indent on

    set mouse=a
    set mousehide
    set shortmess+=filmnrxoOtT
    set ttyfast

    " set timeout timeoutlen=500 ttimeoutlen=1
    au FocusLost * silent! wa

    scriptencoding utf-8

    if !exists('g:no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    colorscheme solarized
    set bg=light

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        " Selected characters/lines in visual mode
    endif

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    " Instead of these two options, we can set a single directory for all
    " backups and temporary buffers. This is a better solution in case we don't
    " want our current buffer to be destroyed due to any IOError.
    "
    " set backupdir=~/.vimtmp
    " set directory=~/.vimtmp
    set nobackup
    set nowritebackup " Writes the buffer to the same file
    set noswapfile

    set list listchars=tab:▸\ ,trail:·
    set tags=./tags;/
    set mps+=<:>
    set backspace=2
    set ignorecase
    set smartcase
    set autoread
    set showmatch
    set smarttab
    set showcmd
    set incsearch
    set nu
    set visualbell t_vb=
    " set t_RV=
    set title
    set cursorline
    set cursorcolumn
    set viminfo='20,\"500
    set hidden
    set history=100
    "set clipboard=unnamedplus
    set clipboard+=unnamedplus
    set scrolloff=10
    set foldenable
" }

" Formatting {
"
    set autowrite
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set nojoinspaces
    set shiftround
    set splitright
    set splitbelow
    set wrap
    set formatoptions+=t
    set tw=79
    syntax on
    set foldmethod=syntax

    augroup vimrcEx
        autocmd!

        autocmd FileType text setlocal spell
        autocmd FileType haskell,puppet,ruby,yml,html,yaml,urdf setlocal expandtab shiftwidth=2 softtabstop=2

        " When editing a file, always jump to the last known cursor position.
        " Don't do it for commit messages, when the position is invalid, or when
        " inside an event handler (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

        " Set syntax highlighting for specific file types
        autocmd BufRead,BufNewFile *.md set filetype=markdown

        " Set spell for markdown files
        autocmd BufRead,BufNewFile *.md setlocal spell
    augroup END

    let g:omni_complete=1

    set wildchar=<Tab> wildmenu wildmode=full
    set complete=.,w,t
    "
    "set wildmenu
    "set wildmode=list:longest
    set wildignore+=.hg,.git,.svn " Version Controls"
    set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
    set wildignore+=*.spl "Compiled speolling world list"
    set wildignore+=*.sw? "Vim swap files"
    set wildignore+=*.DS_Store "OSX SHIT"
    set wildignore+=*.luac "Lua byte code"
    set wildignore+=migrations "Django migrations"
    set wildignore+=*.pyc "Python Object codes"
    set wildignore+=*.orig "Merge resolution files"
" }


" Key (re)mapping {
    "
    let mapleader=','
    let maplocalleader=",,"
    set pastetoggle=<F2>

    " Windows like movements for long lines with wrap enabled:
    noremap j gj
    noremap k gk

    " Allow saving of files as sudo when I forget to start vim using sudo.
    cmap w!! :w !sudo tee > /dev/null %

    " Do not leave visual mode after visually shifting text
    vnoremap < <gv
    vnoremap > >gv

    " Tab control
    nmap <Leader>t :tabnew<cr>
    nmap <Leader>n :tabnext<cr>
    nmap <Leader>p :tabprevious<cr>
    nmap <Leader>c :tabclose<cr>
    nmap <Leader>to :tabe 

    "
    noremap <leader>ss :call StripWhitespace()<CR>
" }

" Functions {
"
    " Strip trailing whitespace (<leader>ss)
    function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction

    function! ClearGutters()
        highlight clear SignColumn
        highlight clear LineNr
    endfunction

    if exists("+spelllang")
        set spelllang=en_us
    endif

    set spellfile=~/.vim/spell/en.utf-8.add

    if has('gui_running')
        " Remove toolbar, scrollbar and any noise from GUI
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
        set guioptions-=m
        set guioptions+=a
        set guifont=Monospace\ 11
        set lines=40
    endif

" }

" Plugins specific settings {

    " nerdTree {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
        nnoremap <F9> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.vim$', '\~$', '\.pyc$']
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    endif
    " }
" }
