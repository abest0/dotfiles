syntax on

set background=dark
colorscheme feral
set number          " set the basic line number style
set relativenumber 	" set the number style
set cursorline      " highlight current line


call plug#begin('~/.vim/plug')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

call plug#end()


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
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P


" set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

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
nmap        <F8> :TagbarToggle<CR> " adds key for toggling the tagbar
set showmode

set nowrap
set splitright
set splitbelow


" vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'luna'

" Use deomplete.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
" Use smartcase.
let g:deoplete#enable_smart_case = 1
inoremap <expr><C-g> deoplete#undo_completion()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
imap <expr> <CR> pumvisible() ? deoplete#close_popup() : "<Plug>delimitMateCR"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-y>  deoplete#close_popup()
inoremap <expr><C-e>  deoplete#cancel_popup()"

" Enable omni completion.
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#smart_auto_mappings = 0
    let g:deoplete#omni_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'

" Search for word under cursor
nnoremap <Leader><S-F> :%s/\<<C-r><C-w>\>/
nnoremap <Leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" remove the preview window on auto coompletion
set completeopt-=preview

" adds searching for the visually selected text
vnoremap // y/<C-R>"<CR>

" insert lines
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" copy & paste like a BAWSSSS!!
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR> 

" Inserts a line when using delimitMate
inoremap <C-c> <CR><Esc>O

" Adding in go lint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Silver Searching
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " use ag in ctrlP for listing files
    " let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup -g ""'
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden 
		\ --ignore .git 
        \ --ignore .svn 
        \ --ignore .hg 
        \ --ignore .DS_Store 
        \ --ignore "**/*.pyc" -g ""'

    " ag is fast enought that ctrlp does need caching
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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


noremap <silent> <leader>SS <ESC>:SyntasticToggleMode<CR>
noremap <silent> <leader>SC <ESC>:SyntasticCheck<CR>
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
