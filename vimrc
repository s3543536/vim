" enable pathogen (autoloading of bundles)
call pathogen#infect()

" Enable 256 colors! :)
set t_Co=256
" This is for ansii escapechars ... not needed in xfce4-terminal at least
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
colorscheme javipolo

if has("syntax")
  syntax on
endif
set background=dark

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" My custom leader key
let mapleader='ç'

set list
set listchars=tab:▸\ ,eol:¬

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Faster scroll throug windows
map <C-t> <C-w>w
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Removed the following mappings because they overlap ... beter enabling mouse
" map <C-o> <C-w><
" map <C-i> <C-w>>
" map <C-u> <C-w>+
" map <C-y> <C-w>-
" map <C-p> <C-w>=

" Enable mouse even within screen
set ttymouse=xterm2
set mouse=a

" Show line numbers by default
set number
" remap for toggling paste mode (list, number and paste), normal, insert and command line mode
nnoremap <F12> :set list! number! paste!<CR>
inoremap <F12> <C-o>::set list! number! paste!<CR>
cnoremap <F12> <C-c>::set list! number! paste!<CR>

" We do pastetoggle with the previous section
"set pastetoggle=<F12>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Always show the status line
set laststatus=2
" statusline (with git support from Fugitive.vim)
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %{fugitive#statusline()}\ Line:\ %l

" keymappings for tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a) :Tabularize /=><CR>
vmap <Leader>a) :Tabularize /=><CR>

" Set filetype for haproxy.cfg
au BufRead,BufNewFile haproxy.cfg set filetype=haproxy

" enable indentation based on filetype by default
filetype plugin indent on

" Fold and unfold using leader-space
nnoremap <Leader><Space> za

" Manage .vimrc easily
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>

" File to store local customizations
if filereadable(glob("~/.vim/vimrc.local"))
    source ~/.vim/vimrc.local
endif
