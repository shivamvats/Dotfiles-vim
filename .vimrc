call plug#begin('~/.vim/plugged')
"
" always enabled
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'docunext/closetag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'icymind/NeoSolarized'
Plug 'tomtom/quickfixsigns_vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh', 'frozen': 'true'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'Rykka/InstantRst'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
Plug 'yssl/QFEnter'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
"Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'Shougo/unite.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/MatchTagAlways'
"Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'jistr/vim-nerdtree-tabs'
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
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'itspriddle/vim-jquery', {'for': ['javascript']}
Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
Plug 'fs111/pydoc.vim', {'for': 'python'}
Plug 'rhysd/vim-clang-format', {'for': 'cpp'}

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

    "color smyck

    colorscheme NeoSolarized
    set bg=light
    "set bg=dark

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        " Selected characters/lines in visual mode
    endif

    "Using airline
    "if has('statusline')
    "    set laststatus=2

    "    " Broken down into easily includeable segments
    "    set statusline=%<%f\                     " Filename
    "    set statusline+=%w%h%m%r                 " Options
    "    if isdirectory(expand("~/.vim/plugged/vim-fugitive"))
    "        set statusline+=%{fugitive#statusline()} " Git Hotness
    "    endif
    "    set statusline+=\ [%{&ff}/%Y]            " Filetype
    "    set statusline+=\ [%{getcwd()}]          " Current dir
    "    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    "endif

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

    if exists('g:omni_complete')
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
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

    " vim-airline {
    " statusline
    if isdirectory(expand("~/.vim/plugged/vim-airline"))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme = 'solarized'
        " let g:airline_powerline_fonts=1
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
        let g:airline_section_a=''
        let g:airline_section_z = ''
        let g:airline_section_y = '%c | %l/%L | %P'
    endif
    " }

    " syntastic {
    if isdirectory(expand("~/.vim/plugged/syntastic"))
        " To close the error window when using :bdelete command
        nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
        cabbrev <silent> bd lclose\|bdelete

        let g:syntastic_python_python_exec = '/usr/bin/python3' " use python3
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_ruby_checkers = ['rubocop']

        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 0
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 0

        let g:syntastic_cpp_compiler_options = "-std=c++17 -l~/ros/catkin_ws/build -Wall -Wextra -Wpedantic"
        let g:syntastic_cpp_compiler = "g++"
        let g:syntastic_cppcheck_config_file = ""

        " Function to run/close check.
        function! ToggleSyntastic()
            for i in range(1, winnr('$'))
                let bnum = winbufnr(i)
                if getbufvar(bnum, '&buftype') == 'quickfix'
                    lclose
                    return
                endif
            endfor
            SyntasticCheck
        endfunction

    endif
    " }

    " vim-notes {
    "
    let g:notes_title_sync = 'rename_file'
    " }

    " unite {
    if isdirectory(expand("~/.vim/plugged/unite.vim"))
        let g:unite_kind_file_vertical_preview = 1
        " Use the fuzzy matcher for everything
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        " Start in insert mode
        let g:unite_enable_start_insert = 1
        " Enable history yank source
        let g:unite_source_history_yank_enable = 1
        " Map space to the prefix for Unite
        nnoremap [unite] <Nop>
        nmap <space> [unite]
        " Quick file search
        nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>
        " Quick grep from cwd
        nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>
        " Quick yank history
        nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
        " Set up some custom ignores
        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                    \ 'ignore_pattern', join([
                    \ '\.git/',
                    \ 'git5/.*/review/',
                    \ 'tmp/',
                    \ 'node_modules/',
                    \ 'bower_components/',
                    \ 'dist/',
                    \ '.pyc',
                    \ ], '\|'))
        " Quick line
        nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
        " Quick commands
        nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>
        " Quick search buffers
        nnoremap <silent> [unite]b :<C-u>Unite -quick-match buffer<CR>
    endif
    " }

    " vim-hdevltools {
    if isdirectory(expand("~/.vim/plugged/vim-hdevtools"))
        au FileType haskell nnoremap <buffer> <Leader>ht :HdevtoolsType<CR>
        au FileType haskell nnoremap <buffer> <silent> <Leader>hc :HdevtoolsClear<CR>
        au FileType haskell nnoremap <buffer> <silent> <Leader>hi :HdevtoolsInfo<CR>
    endif
    " }

    " mundo {
        nnoremap <F5> :MundoToggle<CR>
        set undofile
        set undodir=~/.vim/undo
        let g:mundo_width = 60
        let g:mundo_preview_height = 30
    " }

    " YouCompleteMe {
    if isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
        " global configuration file for C like languages
        let g:ycm_global_ycm_extra_conf = '/home/aries/.ycm_extra_conf_ros.py'
        let g:ycm_filetype_blacklist = {'notes' : 1, 'markdown' : 1, 'text' : 1, 'unite' : 1}
        let g:ycm_error_symbol = 'E'
        let g:ycm_warning_symbol = 'W'
        let g:ycm_autoclose_preview_window_after_completion=1
        let g:ycm_confirm_extra_conf = 0
        let g:ycm_goto_buffer_command= 'same-buffer' "'vertical-split'
        let g:ycm_show_diagnostics_ui = 1
        " let g:ycm_cache_omnifunc = 1

        nnoremap <leader>r :YcmCompleter GoToReferences <CR>
        nnoremap <leader>s :YcmCompleter GoToType<CR>
    endif
    " }

    " MatchTagAlways {
    "
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'erb' : 1,
    \}
    " }

    " Tagbar {
    "if isdirectory(expand("~/.vim/plugged/tagbar"))
        "nmap <leader>tt :TagbarToggle<CR>
    "endif
    " }
    " Using Vista instead
    nmap <leader>tt :Vista show<CR>
    " Go to the tag in the bar
    nmap <leader>tm :Vista focus<CR>
    nmap <leader>tc :Vista!<CR>

    " vim-expand-region {
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)
    " }

    " indentline{
    let g:indentLine_maxLines = 500
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indentLine_enabled = 1
    let g:indentLine_conceallevel = 0
    let g:indentLine_setConceal = 0
    nmap <leader>il :IndentLinesToggle<CR>
    " }
    "
    " Goyo {
    let g:goyo_width = 100
    function! s:goyo_enter()
        if has('gui_running')
            set linespace=1
            Limelight
            call ClearGutters()
        elseif exists('$TMUX')
            silent !tmux set status off
        endif
    endfunction

    function! s:goyo_leave()
        if has('gui_running')
            call ClearGutters()
            Limelight!
        elseif exists('$TMUX')
            silent !tmux set status on
        endif
    endfunction

    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoLeave nested call <SID>goyo_leave()
    " }
" }
" Change cursor shape in insert mode in vim.
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

" molokai
"let g:molokai_original = 1

" Ultisnips
let g:UltiSnipsEditSplit="horizontal"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/snips"
let g:UltiSnipsSnippetDirectories=["snips", "ultisnips"]

set spell
autocmd BufEnter * silent! lcd %:p:h
set formatprg=par

" for using clang-format.
"let g:clang_format_fallback_style="llvm"
"let g:clang_format_path="/home/aries/bin/clang-format"
"map <C-I> :py3f ~/.vim/clang-format.py<CR>
"imap <C-I> <ESC>:py3f ~/.vim/clang-format.py<CR>i
"
"function FormatFile()
"    let l:lines="all"
"    py3f ~/.vim/clang-format.py
"endfunction
"nmap <C-I>a :call FormatFile()<CR>
if !executable('clang-format') && executable('clang-format-3.8')
  let g:clang_format#command = 'clang-format-3.8'
endif
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "IndentWidth" : 4 }
"let g:clang_format#auto_format_on_insert_leave = 1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Set window size equal to the line length.
if has("gui_running")
    set columns=87
endif

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" NerdTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Ctrlp
let g:ctrlp_root_markers=['.ctrlp']

" Vimtex
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ 'continuous' : 1
        \}
let g:vimtex_quickfix_autojump=0
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_open_on_error=0

" InstantRst
let g:instant_rst_browser='google-chrome'
let g:instant_rst_forever=1

" Riv
let project1 = { 'Research': 'My Working Notes', 'path': '~/Dropbox/projects/rst',}
let g:riv_projects = [project1]

" Vimwiki
let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]

nmap <Leader>wah :VimwikiAll2HTML<CR>

"Fugitive
nmap <Leader>st :Gstatus<CR>
nmap <Leader>df :Gdiff<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>ci :Gcommit<CR>
nmap <Leader>rm :Gremove<CR>

" Switch between cases by pressing ~.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25

" projectionist
let g:projectionist_heuristics = {
\ '*.cpp':{
\    'alternate': '{}.h',
\    'type': 'source'
\    },
\    '*.h': {
\    'alternate': '{}.cpp',
\    'type': 'header'
\    },
\}

" Syntastic
nnoremap <F8> :call ToggleSyntastic()<CR>

" Disable highlitght on pressing ESC
nnoremap <esc> :noh<return><esc>

" Browse old files
nnoremap :bro :browse oldfiles 

"FZF
nnoremap <C-b> :Buffers<CR>
nnoremap <C-m> :Marks<CR>

"QFEnter
"Open file in quickfix list in a split
"Emulates CtrlP behavior
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
