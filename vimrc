syntax on
set re=0

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

Plug 'pearofducks/ansible-vim'


" Js plugins
" Plug 'pangloss/vim-javascript' " JavaScript syntax"
" Plug 'leafgarland/typescript-vim' " TypeScript syntax"
" Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'

" Plug 'ternjs/tern_for_vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Plug 'buoto/gotests-vim'

" Plug 'martinda/Jenkinsfile-vim-syntax'

" python stuff
" Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }
" Plug 'davidhalter/jedi-vim'
" Plug 'tweekmonster/django-plus.vim'

Plug 'qpkorr/vim-bufkill'

" Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }

Plug 'itchyny/lightline.vim'

Plug 'mgee/lightline-bufferline'


" Plug 'reedes/vim-pencil'

Plug 'mileszs/ack.vim'

" Plug 'nathanaelkane/vim-indent-guides'

" documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }


" PlatformIO
" Plug 'normen/vim-pio'

" CSV
Plug 'chrisbra/csv.vim'

Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
" Plug 'maksimr/vim-jsbeautify'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" Plug 'hashivim/vim-terraform'

" Plug 'vim-latex/vim-latex'
" Plug 'mhartington/oceanic-next'


" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
"
" Plug 'prabirshrestha/vim-lsp'
" if !has('nvim')
"       Plug 'rhysd/vim-healthcheck'
" endif
"


" the pretty
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'main'  }

call plug#end()


"============================== 
" Nord Settings
"============================== 
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1

" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox
colorscheme nord

" highlight CursorLine term=NONE cterm=NONE ctermbg=236 guibg=#

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4
set backspace=2     " Backspace to delete up a line
set softtabstop=2   " Sets the number of columns for a TAB

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
nnoremap <leader>f :Ack<Space>



"============================== 
" COC.NVIM settings
"============================== 
set hidden
set nowritebackup

" set cmdheight=2
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <TAB>
"     \ pumvisible() ? coc#_select_confirm() :
"     \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr><silent> <cr> pumvisible() ? "\<C-y>" : "\<C-R>=CROverride()\<CR>"


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! CROverride()
    if delimitMate#WithinEmptyPair()
        return "\<C-R>=delimitMate#ExpandReturn()\<CR>"
        echom "Gooba"
    endif

    return "\<C-g>u\<CR>"
endfunction


" Use `[c` and `]c` to navigate diagnostics
if &diff
  " noop
else
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

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
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'fugitive', 'readonly', 'filename', 'modified' ] ],
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
      \   'fugitive': 'LightlineFugitive',
      \ },
      \ }


function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
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
nmap <leader>p :Files<CR>
nmap <leader>r :Tags<CR>
nmap <leader><Enter> :Buffers<CR>
nmap <leader>H :History<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

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

let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-json',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-html',
      \ 'coc-css'
      \ ]

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

if executable('ruff')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff',
        \ 'cmd': {server_info->['ruff', 'server']},
        \ 'allowlist': ['python'],
        \ 'workspace_config': {},
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " add your keybindings here (see https://github.com/prabirshrestha/vim-lsp?tab=readme-ov-file#registering-servers)

    let l:capabilities = lsp#get_server_capabilities('ruff')
    if !empty(l:capabilities)
      let l:capabilities.hoverProvider = v:false
    endif
endfunction

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 2
let delimitMate_backspace = 2


noremap <silent> <leader>c <ESC>:ALEToggle<CR>
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '->'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
highlight ALEWarning ctermbg=DarkMagenta
