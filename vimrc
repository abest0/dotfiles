syntax on

set background=dark
set number          " set the basic line number style
set relativenumber 	" set the number style
set cursorline      " highlight current line



call plug#begin('~/.vim/plug')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'

" the pretty
Plug 'morhetz/gruvbox'


" Js plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim'

" autocomplete
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

Plug 'buoto/gotests-vim'

Plug 'martinda/Jenkinsfile-vim-syntax'

" python stuff
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }
Plug 'davidhalter/jedi-vim'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'tweekmonster/django-plus.vim'

Plug 'qpkorr/vim-bufkill'

" Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }

Plug 'itchyny/lightline.vim'

Plug 'mgee/lightline-bufferline'


Plug 'reedes/vim-pencil'

Plug 'mileszs/ack.vim'

Plug 'nathanaelkane/vim-indent-guides'


" CSV
Plug 'chrisbra/csv.vim'

Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

Plug 'hashivim/vim-terraform'

Plug 'vim-latex/vim-latex'
Plug 'mhartington/oceanic-next'

call plug#end()


let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

highlight CursorLine term=NONE cterm=NONE ctermbg=236 guibg=#fa8cfa

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set backspace=2     " Backspace to delete up a line
set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces
filetype on
filetype plugin indent on

" change the mapleader from \ to ,
let mapleader=","

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" adds mapping for NERDTreeFind
let NERDTreeIgnore = ['\.pyc$']
noremap <leader>w <Esc>:NERDTreeFind<CR>

" don't beep
set visualbell
set noerrorbells

" no backup... no swap!
set nobackup
set noswapfile

" making life more difficult for everyone
" prevents using up, down, left, right to navigate
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>

" automatically start up NERDTree on vim startup
map <C-n> :NERDTreeToggle<CR>   " toggle NERDTree

" expanding the size of windows
nnoremap + <c-w>+
nnoremap - <c-w>-

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" adds some more mappings to move around like all of the other vimbots
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quick escaping from insert mode
inoremap jj <ESC>

" resize current buffer by +/- 5 
nnoremap <silent> <leader>h :vertical resize +5<cr>
nnoremap <silent> <leader>l :vertical resize -5<cr>
nnoremap <silent> <leader>k :resize +5<cr>
nnoremap <silent> <leader>j :resize -5<cr>

" automatically save when losing focus
autocmd BufLeave,FocusLost * silent! :wa

autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" adds syntax highlighting and indenting for js files
let g:jsx_ext_required = 0

" cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

"   [F2]    shows and hides whitespace.
nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
"   [F3]    toggle paste mode
nnoremap    <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" spell checking
nnoremap    <F4> :setlocal spell! spelllang=en_us<CR>
" nmap        <F8> :TagbarToggle<CR> " adds key for toggling the tagbar
set showmode

set nowrap
set splitright
set splitbelow


if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack<Space>


""" FOR STATUSLINE
" set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'
" set nocompatible   " Disable vi-compatibility
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8


" lightline configs
set noshowmode
set showtabline=2 " Show tabline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'fileformat', 'fileencoding'] ]
      \ },
      \ 'tabline': {
      \ 'left': [ ['buffers'] ],
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component': {
      \   'lineinfo': '⭡ %3l:%-2v'
      \ },
      \ 'component_expand': {
      \  'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ }
      \ }


function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" lightline-bufferline
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#unnamed      = '[No Name]'
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" Enable Snippets
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>
let g:neosnippet#snippets_directory = '~/.vim/plug/vim-snippets/snippets'

" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Search for word under cursor
nnoremap <Leader><S-F> :%s/\<<C-r><C-w>\>/

" remove the preview window on auto coompletion
set completeopt-=preview

" adds searching for the visually selected text
vnoremap // y/<C-R>"<CR>

" insert lines
" nmap <S-Enter> O<Esc>j
" nmap <CR> o<Esc>k

" copy & paste like a BAWSSSS!!
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR> 

" Inserts a line when using delimitMate
inoremap <C-c> <CR><Esc>O

" Adding in go lint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Fuzzy file finder
nmap <c-p> :Files<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader><Enter> :Buffers<CR>
nmap <Leader>H :History<CR>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }


set mouse=a

" setup vim-pencil stuff
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd  call pencil#init()
    autocmd FileType text           call pencil#init({'wrap': 'hard'})
augroup END


function! s:goyo_enter()
    silent! tmux set status off
    Pencil
    set nocursorline
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    NoPencil
    set nocursorline
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


map <F11> :Goyo <CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1


let g:python_host_prog = '/Users/abest/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/abest/.pyenv/versions/neovim3/bin/python'

noremap <silent> <leader>c <ESC>:ALEToggle<CR>
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '->'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
highlight ALEWarning ctermbg=DarkMagenta
