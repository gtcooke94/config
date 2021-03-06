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
" Jupyter - can't get this working right now Plugin 'szymonmaszke/vimpyter'

" Solarized Colorscheme
Plugin 'altercation/vim-colors-solarized'

" Linting
Plugin 'w0rp/ale'

" vim statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" List toggle
Plugin 'Valloric/ListToggle'

" Neovim autocompletion
Plugin 'Shougo/deoplete.nvim'

" Ctags/jumping between definitions in project
Plugin 'ludovicchabant/vim-gutentags'

" Git integration
Plugin 'tpope/vim-fugitive'

" Python autocompletion for deoplete
Plugin 'deoplete-plugins/deoplete-jedi'

" Integrate tmuxline with vim airline
Plugin 'edkolev/tmuxline.vim'

" Black (python autoformatter)
Plugin 'ambv/black'

" Go
Plugin 'fatih/vim-go'

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

" Hybrid Line Number Toggle
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Tabstop settings
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap J <C-f>
nnoremap K <C-b>

" Set backup, swaps
set backup
set backupdir=~/.vim/backups
set dir=~/.vim/swaps

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

let g:airline#externsions#tmuxline#enabled = 0
" Solarized colorscheme
syntax enable
set background=dark
colorscheme solarized
" Swap between solarized light and dark, mix with iTerm2 to swap dark and light
" theme
" call togglebg#map("<F5>")
map <Leader>bg :call Swapbg()<CR>
    
function Swapbg()
    let g:airline_solarized_bg = ( &background == "dark"? "light": "dark" )
    let &background = ( &background == "dark"? "light": "dark" )
endfunction

function Setbg(color)
    let g:airline_solarized_bg = a:color
    let &background = a:color
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline show all buffers when there is only one tab open
let g:airline#externsions#tabline#enabled = 1

" Airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_font = 1

" Powerline working with airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" List toggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" Text wrapping BAD, this inserts newlines
" set textwidth=79
" This just visually wraps the text, we like this
set wrap

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 0
let g:ale_linters = {'python': ['pyflakes', 'pylint', 'flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nnoremap <localleader>l :ALELint<cr>

" Folding
set foldmethod=indent
nnoremap <leader>o zo 
nnoremap <leader>f zc

" Open tag in new tab
nnoremap <leader>] <C-w><C-]><C-w>T

" let g:gutentags_project_root = ['.customprojectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout']
" Mac only
" let g:python3_host_prog = '/Users/gcooke/.virtualenvs/neovim/bin/python3'
" let g:python_host_prog = '/Users/gcooke/.virtualenvs/neovim2/bin/python2'
" let g:black_virtualenv = '/Users/gcooke/.virtualenvs/neovim3'
"" DON'T USE
" let g:python3_host_prog = 'python3'
" let g:python_host_prog = 'python'

" Go Settings
nnoremap <leader>b :GoBuild<cr>
nnoremap <leader>r :GoRun<cr>
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" call deoplete#custom#option('jedi', 'ignore_errors', 1)

" Temp for jedi bugs
" let g:deoplete#sources#jedi#ignore_errors = v:true
