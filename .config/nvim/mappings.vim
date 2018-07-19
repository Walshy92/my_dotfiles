" Change <Leader>
let mapleader = ","

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" enhances the percent command
runtime macros/matchit.vim

" Escape from insert mode with jj
inoremap jj <esc>:w<CR>

let g:multi_cursor_exit_from_insert_mode = 0

" Jsx on all js files
let g:jsx_ext_required = 0

" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Airline status bar config
" =============================================================================
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#close_symbol = '×'

"==============================================================================
" Easy access to start of the line
nmap 0 ^

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>sp :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" j and k will move down virtual line even when text is wrapped
nmap j gj
nmap k gk

" search next/previous -- center in page
nmap n nzz
nmap N Nzz

" jump between methods
nmap <Leader>k [m
nmap <Leader>j ]m

" Strip Whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open a new tab
nmap <Leader>y :tabnew<CR>

"auto indent the file
nmap <Leader>i gg=G''

" Easymotion.vim mappings from https://github.com/easymotion/vim-easymotion

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Vim.test mappings
map <Leader>t :TestFile<CR>:set wrap<CR>
map <Leader>s :TestNearest<CR>:set wrap<CR>
map <Leader>l :TestLast<CR>:set wrap<CR>
map <Leader>a :TestSuite<CR>:set wrap<CR>

" Rails.vim mappings
nmap <Leader>ae :AE<CR>
nmap <Leader>av :AV<CR>
nmap <Leader>re :RE<CR>
nmap <Leader>rv :RV<CR>
nmap <Leader>ec :Econtroller<space>
nmap <Leader>vc :Vcontroller<space>
nmap <Leader>em :Emodel<space>
nmap <Leader>vm :Vmodel<space>
nmap <Leader>ev :Eview<space>
nmap <Leader>vv :Vview<space>

nmap <Leader>sv :Server<CR>
nmap <Leader>ksv :Server!-<CR>
nmap <Leader>co :Console<CR>

" Stop spring
nmap <Leader>ss :!spring stop<CR>

command! Q q " bind :Q to :q
command! E e " bind :E to :e

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Vim fugitive maping
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>go :Git checkout<Space>

" Navigating from terminal
nmap <leader>tr :terminal<CR>
nmap <leader>tn :tabnew<CR>:terminal<CR>
nmap <leader>tc :vsp<CR>:terminal<CR> rails c<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" delete current file
nnoremap <leader>rm :call delete(expand('%:p')) \| bd!<CR>

" Eval ruby files
map <leader>r :!ruby %<cr>

" Toggle Paste
nnoremap <leader>p :set invpaste paste?<CR>
imap <leader>p <C-O>:set invpaste paste?<CR>
set pastetoggle=<leader>p

" Hash rocket removal command
command! -range=% RemoveHashRocket silent execute <line1>.','.<line2>.'s/:\(\w\+\)\s*=>\s*/\1: /g'
nmap <Leader>hr :RemoveHashRocket<CR>

" Custom commands for navigating with ctags
map <Leader>[ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-]> g<C-]>

" Copy filepath
nmap <Leader>fp :let @+=@%<CR>

" Function for jumping to webpages from vim
function! Goto(site)
  let l:site = a:site
  if l:site !~? '^https\?:\/\/'
      let l:site = 'https://' . l:site
  endif

  call netrw#BrowseX(l:site, netrw#CheckIfRemote())
endfun

command! -nargs=1 GoToSite call Goto(<f-args>)
command! -nargs=1 GoToDevDocs call Goto('http://devdocs.io/#q=' . <f-args>)
command! -nargs=1 GoToWordDevDocs call Goto('http://devdocs.io/#q=' . expand(<f-args>))
command! -nargs=1 GoToGitlab call Goto('http://git.tagadab.com/apps/' . <f-args> . '/pipelines')

nnoremap <Leader>g :GoToSite<space>
nnoremap <Leader>d :GoToDevDocs<space>
nnoremap <Leader>df :GoToWordDevDocs<space><cword><CR>
nnoremap <Leader>gt :GoToGitlab<space>

" Addes line numbers to :Explore
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
else
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('rg')
  call denite#custom#var('file_rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading'])
else
 call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#option('default', 'prompt', '>')
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
  \ ['git', 'ls-files', '-co', '--exclude-standard'])

" denite file search (c-p uses gitignore, c-o looks at everything)
map <C-P> :DeniteProjectDir -buffer-name=git -highlight-matched-char=Directory file_rec/git<CR>
map <C-A> :DeniteProjectDir -buffer-name=files -highlight-matched-char=Directory  file_rec<CR>

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')

" denite content search
nnoremap \ :DeniteProjectDir -buffer-name=grep -highlight-matched-char=Directory grep:::!<CR>
nnoremap K :DeniteProjectDir -buffer-name=grep -highlight-matched-char=Directory grep:::`expand('<cword>')`<CR>

" Veritcal line config
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" Run specs in iTerm2
let test#strategy = "dispatch"

" Neomake Config
" brew install elixir
autocmd! BufWritePost *.ex Neomake elixir

if executable('rubocop') == 1
  " gem install rubocop
  autocmd! BufWritePost *.rb Neomake rubocop
endif

" npm install -g coffeelint
autocmd! BufWritePost *.coffee Neomake coffeelint
" gem install haml_lint
autocmd BufWritePost *.haml Neomake hamllint

let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '✘',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_info_sign = {
      \ 'text': '➤'
      \ }

augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

" Netrw options
let g:netrw_liststyle = 1
let g:netrw_banner = 0

" Gem rvm-ctags adds ctags to ruby to jump to ruby definitions
autocmd FileType ruby
  \ let &tags .= "," . $MY_RUBY_HOME . "/lib/tags" |
  \ let &path .= "," . $MY_RUBY_HOME . "/lib"


"==============================[ SetNumberDisplay ]=============================
" Varies the display of numbers.
"
" This is not a 'mode' specific setting, so a simple autocommand won't work.
" Numbers should not show up in a terminal buffer, regardless of if that
" buffer is in terminal mode or not.
"===============================================================================

function! SetNumberDisplay()
  if &buftype == 'terminal'
    setlocal nonumber
    setlocal norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction

function! InsertMode()
  if (expand('%t') !~ 'spec') && (expand('%t') !~ 'test')
    startinsert
  elseif (expand('%t') =~ 'spec') || (expand('%t') =~ 'test')
    if winheight('%') < 20
      execute 'resize 20'
    endif
  endif
endfunction

augroup startup
  autocmd!
  " turn numbers on for normal buffers; turn them off for terminal buffers
  autocmd TermOpen,BufWinEnter * call SetNumberDisplay()

  " when in a neovim terminal, add a buffer to the existing vim session
  " instead of nesting (credit justinmk)
  autocmd VimEnter * if !empty($NVIM_LISTEN_ADDRESS) && $NVIM_LISTEN_ADDRESS !=# v:servername
    \ |let g:r=jobstart(['nc', '-U', $NVIM_LISTEN_ADDRESS],{'rpc':v:true})
    \ |let g:f=fnameescape(expand('%:p'))
    \ |noau bwipe
    \ |call rpcrequest(g:r, "nvim_command", "edit ".g:f)
    \ |call rpcrequest(g:r, "nvim_command", "call SetNumberDisplay()")
    \ |qa
    \ |endif

  " enter insert mode whenever we're in a terminal
  autocmd TermOpen,BufWinEnter,BufEnter term://* call InsertMode()
augroup END

lua << EOF
local nvimux = require('nvimux')

-- Nvimux configuration
nvimux.config.set_all{
  prefix = '<C-s>',
  open_term_by_default = true,
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  quickterm_size = '80',
}

-- Nvimux custom bindings
nvimux.bindings.bind_all{
  {'-', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  {'\\', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
  {'1', '<Esc>1gt', {'n', 'v', 'i', 't'}},
  {'2', '<Esc>2gt', {'n', 'v', 'i', 't'}},
  {'3', '<Esc>3gt', {'n', 'v', 'i', 't'}},
  {'4', '<Esc>4gt', {'n', 'v', 'i', 't'}},
  {'5', '<Esc>5gt', {'n', 'v', 'i', 't'}},
  {'6', '<Esc>6gt', {'n', 'v', 'i', 't'}},
  {'7', '<Esc>7gt', {'n', 'v', 'i', 't'}},
  {'8', '<Esc>8gt', {'n', 'v', 'i', 't'}},
  {'9', '<Esc>9gt', {'n', 'v', 'i', 't'}},
}

-- Required so nvimux sets the mappings correctly
nvimux.bootstrap()
EOF
