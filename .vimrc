set nocompatible
syntax on
set nowrap
set encoding=utf8
set backupdir=~/Temp//
set directory=~/Temp//

" Disable file type for plugins
filetype off                  " requiredfiletype plugin on


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" AG Plugin
Plug 'epmatsw/ag.vim'

" Autogenerate Ctags on save
Plug 'craigemery/vim-autotag'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Increment Search
Plug 'haya14busa/incsearch.vim'

" Visual Indenting
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" Number Toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

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

" Omnisharp
Plug 'OmniSharp/omnisharp-vim'

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
set tabstop=2
set shiftwidth=2
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


" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1"

""""""""""""""""""""""""""
" Mappings configuration "
""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
"
" Numbertoggle
:nnoremap <silent> <C-l> :set relativenumber!<cr>

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Visual Indenting
let g:indentLine_setColors = 0
"call clearmatches()
"let g:indent_guides_enable_on_vim_startup = 1
"let indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=256
"let indent_guides_color_change_percent = 10
"
" REMAP Section {{{
" F-Key REMAPS
map <F6> :w<CR>:!node %<CR>
" ESCAPE KEY REMAPS "
"during insert, kj escapes, `^ is so that the cursor doesn't move
inoremap kj <Esc>`^
"during insert, lkj escapes and saves
inoremap lkj <Esc>`^:w<CR>
"during insert, lkj escapes and saves and QUITS
inoremap ;lkj <Esc>:wq<CR>

" ALE plugin settings
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ['autopep8']}
let g:ale_fix_on_save = 1

" Increment Search Plugin settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
inoremap ;lkj <Esc>:wq<CR>

" LEADERKEY MAPPINGS {{{
let mapleader = ","

" WINDOW movement remaps
nnoremap <leader>x <C-w>x
nnoremap <leader>w <C-w>w
nnoremap <leader>o <C-w>o
"nnoremap <leader>| <C-w>|
"nnoremap <leader>_ <C-w>_
nnoremap <leader>= <C-w>=

" BUFFER management
noremap <leader>b :CtrlPBuffer<cr>
noremap <silent> <leader>d :bp\|bd #<CR>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

" VIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Search and Replace
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" }}}
" }}}

" Quick Fix Window
nnoremap <leader>qo :copen<cr>
nnoremap <leader>qc :cclose<cr>

" OMN
" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1ISHARP SETTINGS {{{
" }}}
