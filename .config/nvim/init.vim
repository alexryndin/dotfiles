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
    " Leader key popup menu
    Plug 'liuchengxu/vim-which-key'
    " Custom statusbar
    Plug 'vim-airline/vim-airline'
    " Fzf vim plugin
    Plug 'junegunn/fzf.vim'
    " Colorize nested parentheses
    Plug 'luochen1990/rainbow'
    " Git, show diff lines
    Plug 'airblade/vim-gitgutter'
    " Magit
    Plug 'jreybert/vimagit'
    " Vim surround
    Plug 'tpope/vim-surround'
    " Git status etc
    Plug 'tpope/vim-fugitive'
call plug#end()


" YCM Configuration
"
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_autoclose_preview_window_after_insertion = '1'
" Disable shitty id completion
" let g:ycm_min_num_of_chars_for_completion = 99

" Look and feel
"   Colors and themes
colorscheme gruvbox
"   line numbers
set nu
set rnu
"   new term config
" let g:go_term_mode = "split"
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Set up persistent undo across all files.
set undofile
"


" Close buffer without closing window. (facepalm)
command! Bd :bp | :sp | :bn | :bd 


" Netrw (tree) config
let NERDTreeQuitOnOpen = 1
" autocmd FileType nerdtree setl bufhidden=wipe


" AirLine Configuration
  " Populate dict with custom font gliphs
let g:airline_powerline_fonts = 1
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace= 'W'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = " "
  " Smart tabs
let g:airline#extensions#tabline#enabled = 1


" Rainbow Configuration
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle




" Key mappings
"

" tab to move text blocks
" https://stackoverflow.com/questions/14641942/how-to-unmap-tab-and-do-not-make-ctrl-i-invalid-in-vim
" noremap <tab> >>
" noremap <s-tab> <<

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
noremap <leader>bb :Buffer<cr>
noremap <leader>bd :Bd<cr>
noremap <leader>bD :w<cr>:Bd<cr>
"   f-key
noremap <leader>fed :e $MYVIMRC<cr>
noremap <leader>ft :NERDTreeToggle<cr>
noremap <leader>fs :w<cr>
noremap <leader>fS :wa<cr>
noremap <leader>ff :FZF<cr>
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

" Which key configuration
" 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Learn vimscript the hard way exercises
" Chapter 01
echo ">^.^<"
" Chapter 02
" Chapter 04
inoremap <c-u> <esc>vawUea
noremap <c-u> vawUe
" Chapter 06
" Chapter 09
noremap H 0
noremap L $
