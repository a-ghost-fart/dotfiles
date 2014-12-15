set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'wookiehangover/jshint.vim'
Plugin 'zeis/vim-kolor'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'msanders/snipmate.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on

" Settings
syntax on
set nu			"line numbers
set t_Co=256		"256 colors
set sh=/bin/bash	"use bash for internal shell
set autoindent		"auto indent
set tabstop=4		"tab stop
set shiftwidth=4    "bored with writing comments now
set expandtab
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=0
set mouse=a
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set guioptions-=T
colorscheme kolor
set cursorline
set hlsearch
set list listchars=tab:\>\ ,trail:.
set laststatus=2
set relativenumber

" Neocomplcache stuff
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3

" CtrlP
let g:ctrlp_working_path_mode = 'ra'

" Colour guff
hi NonText guifg=bg ctermfg=bg
hi LineNr guibg=bg ctermbg=bg
hi Whitespace cterm=underline gui=underline ctermbg=red guibg=red ctermfg=gray guifg=yellow

" Custom commands
map <TAB> :NERDTreeToggle<CR>
map <S-TAB> :QFix<CR>

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
