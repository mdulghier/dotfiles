" --------------------------------------------------------------------
" Plugins
" --------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" General
Plug 'francoiscabrol/ranger.vim'    " File Manager
Plug 'tpope/vim-fugitive'           " Git integration
Plug 'junegunn/gv.vim'              " Git commit browser
Plug 'airblade/vim-gitgutter'       " Git inline change tracking
Plug 'tpope/vim-surround'           " Surround arbitrary navigation targets with characters and stuff
Plug 'vim-ctrlspace/vim-ctrlspace'  " Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " Search
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-gtfo'            " Open terminal

" Appearance
Plug 'vim-airline/vim-airline'      " Make it pretty
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'     " Theme
Plug 'Yggdroot/indentLine'          " Vertical indent indicator lines
Plug 'junegunn/vim-emoji'           " 

" Coding
Plug 'w0rp/ale'                     " Language Server Protocol supported linting and much more
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'         " commenting in/out
Plug 'junegunn/vim-easy-align'      " text alignment
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " JavaScript rename, find references...
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }  " Tag Outline, requires exuberant-ctags installed
"Plug 'joonty/vdebug'                " Debugger, no NodeJS support yet

call plug#end()

" --------------------------------------------------------------------
" Basic Settings
" --------------------------------------------------------------------

set nocompatible 	" disable vi compatibility
set modelines=0  	" prevents security exploits dealing with modelines in files
set shortmess=I     " disable startup message
set ttyfast
set encoding=utf-8
set scrolloff=3       	" show 3 lines context when scrolling
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set backspace=indent,eol,start
set cursorline
set laststatus=2    " always show a status line
set undofile
set mouse=a
set splitbelow		" open new split panes to the bottom
set splitright		" open new split panes to the right
set number

" search
set ignorecase		" if searching all lowercase, search case-insensitive, else search case-sensitive
set smartcase
set gdefault		" use global regex by default
set incsearch		" highlight results as you search
set showmatch
set hlsearch

" line wrapping
set wrap
set textwidth=119
set formatoptions=qrn1

" tabs/spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" central backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" color & theme
syntax on
set background=dark
colorscheme nord
set termguicolors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"


" --------------------------------------------------------------------
" Plugin Settings
" --------------------------------------------------------------------

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_theme='nord'
" let g:airline_theme='ubaryd'

" Ctrlspace
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|Godeps|node_modules)[\/]'

" Ale
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines'],
\   'javascript': ['prettier', 'eslint']
\}
let g:ale_sign_error = emoji#for('collision')
let g:ale_sign_warning = emoji#for('eyes')


" FZF
fun! FzfQueryFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GFiles --exclude-standard --cached --others
    endif
endfun

" Tern
let g:tern_show_loc_after_rename = 0

" GitGutter
let g:gitgutter_enabled = 0         " turn off by default (because of conflict with ALE)

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" Nord Theme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
let g:nord_comment_brightness = 20

" --------------------------------------------------------------------
" Key Mappings
" --------------------------------------------------------------------

let mapleader = ","

" prevent accidental opening of help docs
nnoremap <F1> <ESC>
inoremap <F1> <ESC>			
vnoremap <F1> <ESC>
" navigate splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" navigate while in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" vertical navigation through wrapped lines
nnoremap j gj
nnoremap k gk
" escape insert mode without leaving home row
inoremap jj <ESC>			
" use standard regex instead of vim regex
nnoremap / /\v
vnoremap / /\v
" Q to replay macros
nnoremap Q @q
" remap % to <tab> to navigate matching brackets
nnoremap <tab> %
vnoremap <tab> %
" switch to previous buffer
nnoremap <leader><leader> <C-^>				
" reset search with ,<space>
nnoremap <silent><leader><space> :noh<cr>
" close current buffer
nnoremap <silent><leader>w :bprevious<CR>:bdelete #<CR> 	
" quit
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>q :qa<CR>
" save
nnoremap <C-s> :update<CR>
inoremap <C-s> <C-O>:update<CR>
" ALE
nnoremap <silent><leader>x :ALEFix<CR>
" FZF
nnoremap <leader>be :Buffers<CR> | nnoremap <leader><cr> :Buffers<CR>
nnoremap <C-p> :call FzfQueryFiles()<CR>
nnoremap <silent><leader>f :Lines<CR>
nnoremap <silent><leader>ag :Ag<CR>
nnoremap <silent><leader>gfs :GF?<CR>
" Tern
nnoremap <silent><leader>cw :TernRename<CR>
nnoremap <F11> :TernRefs<CR>
nnoremap <F12> :TernDef<CR>
" Ranger
nnoremap <silent><leader>n :Ranger<CR>
" Fugitive
nnoremap <silent><leader>ga :Git add %:p<CR><CR>
nnoremap <silent><leader>gc :Gcommit -v -q<CR>
nnoremap <silent><leader>gd :Gdiff<CR>
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <silent><leader>gl :Glog<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gps :Gpush<CR>
nnoremap <silent><leader>gpl :Gpull<CR>
" GitGutter
nnoremap <silent><leader>gg :GitGutterToggle<CR>

