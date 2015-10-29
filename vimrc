syntax on


call pathogen#infect()
call pathogen#helptags()

set background=dark
colorscheme feral
set number          " set the basic line number style
"set relativenumber 	" set the number style
set cursorline      " highlight current line

highlight CursorLine term=NONE cterm=NONE ctermbg=236 guibg=#2d2d2d

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

" adds in mappings for CommandT
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

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

" cycle through buggers
nnoremap <Tab> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

nmap <F8> :TagbarToggle<CR> " adds key for toggling the tagbar

set nowrap
set splitright
set splitbelow


" vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'bubblegum'

" NeoComplete Bisshes
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap  <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"       " <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Search for word under cursor
nnoremap <Leader>f :%s/\<<C-r><C-w>\>/

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

set mouse=a
