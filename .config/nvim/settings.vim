set modelines=0   " Turn off modelines
set autoread      " reload files changed outside of vim
" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !
" use Unicode
set encoding=utf-8
set fenc=utf-8
" errors flash screen rather than emit beep
set visualbell
" make Backspace work like Delete
set backspace=indent,eol,start
" set backspace=2   " Backspace deletes like most programs in insert mode
" Stop vim creating backups
set nobackup
set nowritebackup
set noswapfile
" Line number config
set relativenumber
set number
" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3
" Softtabs, 2 spaces
set expandtab softtabstop=2 shiftwidth=2 tabstop=2 shiftround
set autoindent    " always set autoindenting on
" Improve performance with large files
set lazyredraw
set hidden        " Allow buffer change w/o saving
set cursorline    " highlight the current line the cursor is on
" Improves searching
nnoremap / /\v
vnoremap / /\v
set hlsearch ignorecase smartcase incsearch
" Adding special characters to word def
set iskeyword+=@-@
set iskeyword+=?
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a       " Enable mouse mode
set ruler         " show the cursor position all the time
set clipboard=unnamedplus
set wrap

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" flashes matching brackets or parentheses
set showmatch

" Color scheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
