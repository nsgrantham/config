
" Plugins -------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Color schemes
Plug 'dracula/vim'

" Utilities
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

" Language support
Plug 'sheerun/vim-polyglot'

call plug#end()


" Color scheme --------------------

" Disable background highlighting in color scheme
" https://vi.stackexchange.com/questions/16108/neovim-gray-background
" (Put this line before you set color scheme)
au ColorScheme * hi Normal ctermbg=None

colorscheme dracula

let g:lightline = { 'colorscheme': 'dracula' }


" Keybindings ---------------------

" Navigate between panes with Ctrl+direction
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l


" Settings ------------------------

" Status bar
set noshowmode      " Do not show mode, it is already shown in vim-airline

" Lines
set nowrap          " No line wrapping
set number          " Activate linenumbers
"set relativenumber  " Linenumbers relative to current line
set numberwidth=5   " Max digits for linenumbers

" Indentation
set tabstop=8      " Maximum width of tab character, in spaces
set softtabstop=0  " Non-zero value other than tabstop will mix tabs & spaces
set expandtab      " Insert spaces instead of tab characters
set shiftwidth=4   " Size of an indent, in spaces (should evenly divide tabstop)

" Window
set noerrorbells  " Disable error bells
set title         " Show the filename in the window titlebar

" LaTeX
"let g:tex_flavor = "latex"

" Undo syntax concealing
"let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""
"let g:vim_markdown_math = 1

" Highlight first character in line that exceeds 80-character max
" Best to have at end of .vimrc for GUI Vim
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
