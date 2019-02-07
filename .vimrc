set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Fuzzy finder"
Plugin 'ctrlpvim/ctrlp.vim'
" Tmux and vim integration
Plugin 'christoomey/vim-tmux-navigator'
" Commenting
Plugin 'scrooloose/nerdcommenter'
" Jupyter - can't get this working right now
" Plugin 'szymonmaszke/vimpyter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Mapping leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

" Make a split
nnoremap <localleader>w :vsplit<CR>

inoremap jk <Esc>
nnoremap  <leader>s :w<CR>
nnoremap <leader>a :q<CR>

" ctrlp settings
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](git|hg|svn|build|build_dependencies|build_resources|devel)$',
\ 'file': '\v\.(exe|so(\.\d\.\d\.\d)?|dll|pyc)$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

"file searching, info found at ctrlpvim github repo
nnoremap <localleader>f :CtrlP getcwd()<cr>
let g:ctrlp_working_path_mode='w'
let g:ctrlp_show_hidden = 1

" Hybrid Line Number Toggle
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Set backup, swaps
set backup
set backupdir=~/.vim/backups
set dir=~/.vim/swaps

" NerdCommentor Settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

let g:NERDCreateDefaultMappings = 0
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle
