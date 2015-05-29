set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'wookiehangover/jshint.vim'
Plugin 'zeis/vim-kolor'
Plugin 'groenewege/vim-less'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/MatchTag'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'

call vundle#end()

filetype plugin indent on

" Settings
syntax on
set nu              "line numbers
set t_Co=256        "256 colors
set sh=/bin/bash    "use bash for internal shell
set autoindent      "auto indent
set tabstop=4       "tab stop
set shiftwidth=4    "bored with writing comments now
set softtabstop=4
set smarttab
set expandtab
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=0
autocmd VimEnter * NERDTreeClose
set mouse=a
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set guioptions-=T
set cursorline
set hlsearch
set list listchars=tab:\>\ ,trail:.
set laststatus=2
set relativenumber

" Airline
let g:airline_powerline_fonts=1

" Colour guff
colorscheme kolor
hi NonText guifg=bg ctermfg=bg
hi LineNr guibg=bg ctermbg=bg
hi Whitespace cterm=underline gui=underline ctermbg=red guibg=red ctermfg=gray guifg=yellow

" Custom commands
map <TAB> :NERDTreeToggle<CR>
map <S-TAB> :QFix<CR>

" Unite
let g:unite_source_rec_async_command = 'ag --nogroup --nocolor --column --hidden ' .
    \ '--ignore ".git/" ' .
    \ '--ignore "node/" ' .
    \ '--ignore "bower_components/" ' .
    \ '--ignore "node_modules/" ' .
    \ '-g ""'
nnoremap <C-P> :Unite -start-insert file_rec/async<CR>

" Toggle quick fix window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
