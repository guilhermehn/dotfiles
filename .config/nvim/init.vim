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
Plug 'sheerun/vimrc' " Sensible defaults
Plug 'justinmk/vim-sneak' " Extended VIM's t[character] functionality
Plug 'tpope/vim-repeat' " Enables . to repeat plugin commands
Plug 'Yggdroot/indentLine' " Provides vertical indent lines for readability
Plug 'vim-airline/vim-airline' " Statusline
Plug 'bling/vim-bufferline' " Better bufferline
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-complete --tern-completer' } " C++/JS
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} " Generate YCM C++ config for current project
Plug 'scrooloose/nerdtree' " File browser
Plug 'tpope/vim-surround' " Surround content in matching tags, quotes etc
Plug 'Raimondi/delimitMate' " Insert matching closing symbols for paranthesis etc
Plug 'SirVer/ultisnips' " Snnippets
Plug 'honza/vim-snippets' " Snippets
Plug 'morhetz/gruvbox' " Gruvbox color scheme
"Plug 'ervandew/supertab' " ???
Plug 'godlygeek/tabular' " Align text
Plug 'bronson/vim-trailing-whitespace' " Display trailing whitespaces
Plug 'drmikehenry/vim-headerguard' " Generate header guards for C/C++ header files
Plug 'Chiel92/vim-autoformat' " Format code by integrating existing code formatters
Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
Plug 'szw/vim-tags' " Ctags generator
Plug 'rstacruz/sparkup' " A parser for a condensed HTML format
Plug 'vim-scripts/a.vim' " Swtich between source files and header files quickly
Plug 'ryanoasis/vim-devicons' " Programming icons for different VIM plugins
Plug 'vim-scripts/comments.vim' " Quickly add/remove comments
Plug 'jeetsukumaran/vim-buffergator' " List, select and switch between buffers
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'sheerun/vim-polyglot' " A collection of syntax highlighting for different filetypes
Plug 'cakebaker/scss-syntax.vim' " Improved SCSS syntax (SCSS is not included in vim-polygot)
Plug 'gregsexton/matchtag' " Highlight matching HTML tags
Plug 'ternjs/tern_for_vim' " Code analysis for JavaScript. Needed for YCM JS comletion
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

" Close current buffer
command Bd bp | sp | bn | bd

" Linebreak
set tw=150

" Draw vertical line after tw to suggest a line wrap
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Overrides any other configuration in plugins. Enabling line
" highlighting causes extremely high CPU usage on medium+ size files
set nocursorline

" Replace Vim's character search with vim-sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

" Redraw screen only on typing
set lazyredraw

nnoremap <space> za
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
let g:indentLine_color_term = 239
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
let g:ycm_use_ultisnips_completer = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''

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

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1

let g:syntastic_error_symbol = ''
let g:syntastic_warning_symbol = ''
let g:syntastic_style_error_symbol = ''

let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
"let g:syntastic_auto_jump = 2
let g:syntastic_loc_list_height = 1

let g:syntastic_html_checkers = ['tidy']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_css_checkers = ['prettycss']
let g:syntastic_php_checkers = ['phpmd']
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_css_prettycss_args = "--ignore=suggest-relative-unit"
let g:syntastic_javascript_eslint_args = "--config /home/rhs/.config/eslint/config.json"
let g:syntastic_python_pylint_args = "--disable=bad-indentation --disable=mixed-indentation"

let b:syntastic_mode = "active"
