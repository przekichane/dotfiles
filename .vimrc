" Enable wildmenu
set wildmenu

" Always use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

set encoding=utf8

set cursorline
set cursorlineopt=number

set textwidth=79

syntax on
let python_highlight_all=1

" Search by pressing # in visual mode
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"let g:airline_theme = 'catppuccin_mocha'

let g:ycm_autoclose_preview_window_after_completion=1

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'mattn/emmet-vim'
  Plug 'Valloric/YouCompleteMe'
  Plug 'vim-syntastic/syntastic'
  Plug 'nvie/vim-flake8'
call plug#end()

