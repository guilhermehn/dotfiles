" Used F keys:
" F1, F2, F3, F4, F5, F8, F9

" On my way to becoming 1337 VIM user
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"
" VimPlug options
"
call plug#begin()
Plug 'sheerun/vimrc'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-complete --tern-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
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
Plug 'sheerun/vim-polyglot'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gregsexton/matchtag'
Plug 'ternjs/tern_for_vim'
call plug#end()

"enable copy/paste from system buffer
set clipboard=unnamedplus

"
" Color options
"
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'soft'
set background=dark

" Insert newline in Normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Deafault <leader> key
let mapleader=","

" Execute commands in 2 less steps (Hold-Release shift)
nnoremap ; :

" Close current buffer
command Bd bp | sp | bn | bd

" Linebreak
set tw=100

" Draw vertical line after tw to suggest a line wrap
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Overrides any other configuration in plugins. Enabling line
" highlighting causes extremely high CPU usage on medium+ size files
set nocursorline

" Redraw screen only on typing
set lazyredraw

nnoremap <space> za
" fold by indent set in sheerun/vimrc
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" Allow easy navigation between wrapped lines (For arrows)
"map <silent> <Up> gk
"imap <silent> <Up> <C-o>gk
"map <silent> <Down> gj
"imap <silent> <Down> <C-o>gj

" Toggle Paste mode
set pastetoggle=<F2>

"
" Autoformat options
"
noremap <silent> <F3> :Autoformat<CR>

"save read-only files
noremap <F4> :w !sudo tee %<CR>

" Toggle line numbers
noremap <F5> :set invnumber<CR>
inoremap <F5> <C-O>:set invnumber<CR>

"
" Tagbar options
"
nnoremap <silent> <F8> :TagbarToggle<CR>

"
" NerdTree options
"
noremap <silent> <F9> :NERDTreeToggle<CR>
"close window if NerdTree is the last to stand
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Airline options
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"
" IndentLine options
"
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#7f7061'
" Supposed to help with performance, might break indenting in JS files
let g:indentLine_faster = 1

"
" YouCompleteMe options
"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"where to search for .ycm_extra_conf.py if not found
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

"
" UltiSnips options
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       =        '<tab>'
let g:UltiSnipsListSnippets         =       '<c-tab>'
let g:UltiSnipsJumpForwardTrigger    =      '<c-j>'
let g:UltiSnipsJumpBackwardTrigger    =     '<c-k>'

"
" Vim-Tags options
"
"Generate tags on file save
let g:vim_tags_auto_generate = 1

"
" Syntastic options
"
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
"
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['prettycss']
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_css_prettycss_args = "--ignore=suggest-relative-unit"
let g:syntastic_javascript_eslint_args = "--config /home/rhs/.config/eslint/config.json"
let g:syntastic_php_phpmd_args = "text cleancode,codesize,design,unusedcode,controversial"

let b:syntastic_mode = "active"
