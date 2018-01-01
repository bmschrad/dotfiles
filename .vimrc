set nocompatible
syntax on
set nowrap
set encoding=utf8

" Disable file type for plugins
filetype off                  " requiredfiletype plugin on


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Autogenerate Ctags on save
Plug 'craigemery/vim-autotag'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Visual Indenting
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" REACT
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'"

" Tagbar
Plug 'majutsushi/tagbar'

" Linter
Plug 'w0rp/ale'

" Virtual Env
Plug 'jmcantrell/vim-virtualenv'

" Themes
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajh17/Spacegray.vim'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Set filetype plugin back to on
filetype plugin on

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray
" colorscheme spacemacs-theme
 
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " TAB settings

""""""""""""""""""""""""""
" Mappings configuration "
""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Visual Indenting
let g:indentLine_setColors = 0
"call clearmatches()
"let g:indent_guides_enable_on_vim_startup = 1
"let indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=256
"let indent_guides_color_change_percent = 10
"let indent_guides_guide_size = 0
