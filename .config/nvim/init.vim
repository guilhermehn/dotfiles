set nocompatible
filetype off

set title
set clipboard=unnamedplus "enable copying from system buffer

" Treat long lines as break lines
map j gj
map k gk

"
" VimPlug options
"
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/gruvbox'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'drmikehenry/vim-headerguard'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-tags'
Plug 'rstacruz/sparkup'
Plug 'vim-scripts/a.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/comments.vim'
Plug 'jeetsukumaran/vim-buffergator'

Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-scripts/Better-CSS-Syntax-for-Vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()


set history=400
syntax on

"
" Color options
"
colorscheme gruvbox
set background=dark
"Transparent background fix
hi Normal guibg=NONE ctermbg=NONE
" Switch between light and dark background
map <silent> <F7> :call gruvbox#bg_toggle()<CR>
imap <silent> <F7> <ESC>:call gruvbox#bg_toggle()<CR>a
vmap <silent> <F7> <ESC>:call gruvbox#bg_toggle()<CR>gv

set encoding=utf-8
set number "Line numbers
set showcmd
set autoread
set cmdheight=1

" Ignore case when searching
set ignorecase
set smartcase

set hlsearch
set magic

set mat=2
set showmatch
set noerrorbells
set novisualbell

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak
set lbr
set tw=150

"line up soft-wrap prefix with the line numbers
"set cpoptions+=n "start soft-wrap lines (and any prefix) in the line-number area

set si "Smart indent
"set wrap "Wrap line
set breakindent

filetype plugin on
filetype indent on
filetype plugin indent on

"save read-only files
noremap <F4> :w !sudo tee %<CR>

"save file quickly
noremap <F2> :w<CR>

" Insert newline in Normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Toggle line numbers
noremap <F5> :set invnumber<CR>
inoremap <F5> <C-O>:set invnumber<CR>

"
" NerdTree options
"
noremap <silent> <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close window if NerdTree is the last to stand

" Close current buffer
command Bd bp | sp | bn | bd

"
" Airline options
"
let g:airline_powerline_fonts = 1

"
" IndentLine options
"
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1


"
" YouCompleteMe options
""
"let g:ycm_key_invoke_completion = '<Right>'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       =        '<tab>'
let g:UltiSnipsListSnippets         =       '<c-tab>'
let g:UltiSnipsJumpForwardTrigger    =      '<c-j>'
let g:UltiSnipsJumpBackwardTrigger    =     '<c-k>'

"
" Autoformat options
"
noremap <silent> <F3> :Autoformat<CR>

"
" Tagbar options
"
nnoremap <silent> <F8> :TagbarToggle<CR>

"
" Vim-Tags options
"

"Generate tags on file save
let g:vim_tags_auto_generate = 1


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '⁉️'

let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 2
"let g:syntastic_loc_list_height = 1
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['prettycss']

let g:syntastic_css_prettycss_args = "--ignore=suggest-relative-unit"
let g:syntastic_javascript_eslint_args = "--config /home/rhs/.config/eslint/config.json"

let b:syntastic_mode = "active"

" Used F keys:
" F1, F2, F3, F4, F7, F8, F9
