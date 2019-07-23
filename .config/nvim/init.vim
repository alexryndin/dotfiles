let mapleader = "\<Space>"
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" My favorite theme
let g:gruvbox_contrast_dark = 'hard'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
" Easy file tree navigation
Plug 'tpope/vim-vinegar'
" Latest netrw
Plug 'eiginn/netrw'
" Easy motion :-)
Plug 'easymotion/vim-easymotion'
" Fuzzy files and buffers navigations
Plug 'ctrlpvim/ctrlp.vim'
" Autocompletion
let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }
" Go support
" let g:go_def_mode = 'godef'
" let g:go_info_mode = 'gocode'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


" YCM Configuration
"
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_autoclose_preview_window_after_insertion = '1'

" Look and feel
"   Colors and themes
colorscheme gruvbox
"   line numbers
set nu
set rnu
"   new term config
" let g:go_term_mode = "split"

" Set up persistent undo across all files.
set undofile


" Close buffer without closing window. (facepalm)
command! Bd :bp | :sp | :bn | :bd 


" Netrw (tree) config
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let NERDTreeQuitOnOpen = 1


" Key mappings
"
"   Use ; in addition to : to type commands.
noremap ; :
noremap : ;

" tab to move text blocks
noremap <tab> >>
noremap <s-tab> <<

"   Navigation
"   Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
"   Buffer navigation (inspired by unimpired)
noremap b] :bn<cr>
noremap b[ :bp<cr>
noremap <leader><tab> :b#<cr>

"   Leader mappings
"   b-key
noremap <leader>bb :CtrlPBuffer<cr>
noremap <leader>bd :Bd<cr>
noremap <leader>bD :w<cr>:Bd<cr>
"   f-key
noremap <leader>fer :e $MYVIMRC<cr>
noremap <leader>ft :NERDTreeToggle<cr>
noremap <leader>fs :w<cr>
noremap <leader>fS :wa<cr>
"   t-key
noremap <leader>tll :set nu!<cr>
noremap <leader>tlr :set rnu!<cr>
"   q-key
noremap <leader>qq :wq<cr>
noremap <leader>qQ :waq<cr>
" tabs navigation
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 0gt
