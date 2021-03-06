" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif


" ================ NeoBundle Config =====================

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call plug#begin('~/.config/nvim/plugged')

" Colors cause moar pretty
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'
" Markdown
Plug 'gabrielelana/vim-markdown'
" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Required by ghcmod-vim
Plug 'eagletmt/neco-ghc'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-I>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Tab for autocomplete
Plug 'ervandew/supertab'
" Ack integration
Plug 'mileszs/ack.vim'
" comments
Plug 'tpope/vim-commentary'
" Elixir Support
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
" Python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'bfredl/nvim-ipy'
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" NERDTree
Plug 'scrooloose/nerdtree'
" Misc
Plug 'powerman/vim-plugin-AnsiEsc'


call plug#end()

" ================ General Config ====================

set path+=**path                " Sets the path as the current directory and 
                                " Its subfolders
                                
set number                      "Line numbers are good
set incsearch                   "Incremental search
set hlsearch                    "Highlight search
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set ignorecase "Case insensitive search
set smartcase

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Gruvbox Theme Configuration
" colorscheme gruvbox
set background=dark

if (has('termguicolors'))
  set termguicolors
endif

" if !has("gui_running")
"  let g:gruvbox_italic=0
" endif

" colorscheme xterm16
" colorscheme up
" colorscheme Monokai
" colorscheme badwolf
" colorscheme solarized
" colorscheme xoria256
colorscheme OceanicNext


" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

let loaded_matchparen = 1 " Disable Highlighting of matching parens

" set completeopt-=preview "Dont' show scratch buffers

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set wildignore+=*/bin/**
set wildignore+=*/gen/**
set wildignore+=*/target/**

inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" ================ Custom Mappings========================

" Disable arrow keys

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Bind leader-leader to comment
map <Leader><Leader> gc

" Window navigation 
:nnoremap <Leader>h <C-\><C-n><C-w>h
:noremap <Leader>j <C-\><C-n><C-w>j
:nnoremap <Leader>k <C-\><C-n><C-w>k
:nnoremap <Leader>l <C-\><C-n><C-w>l
:nnoremap <Leader>h <C-w>h
:nnoremap <Leader>j <C-w>j
:nnoremap <Leader>k <C-w>k
:nnoremap <Leader>l <C-w>l

:nnoremap <Leader>j <C-j>
:nnoremap <Leader>k <C-k>

" Leader-s to save files
map <Leader>s :w<CR>

" Copies into os register
vnoremap <Leader>y "+y

" Pastes from os register
nnoremap <Leader>p "+p

" Opens NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>

" ================ Scrolling ================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Custom Settings =========================

syntax enable

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Deoplete Javascript Setup
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Haskell autocomplete
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Z - swith to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction

" Command to edit init.vim
command EVim execute ":e ~/.config/nvim/init.vim"

" Command to create the 'tags' file
command! MakeTags !ctags -R .

" Makes Ctrl-P consider a folder that has a .project file a project
let g:ctrlp_root_markers = ['.project']
