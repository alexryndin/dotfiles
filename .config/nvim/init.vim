let mapleader = "\<Space>"
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" My favorite theme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'
    " Easy file tree navigation
"    Plug 'tpope/vim-vinegar'
    " Latest netrw
    Plug 'eiginn/netrw'
    " Easy motion :-)
    Plug 'easymotion/vim-easymotion'
    " Fuzzy files and buffers navigations
   " Autocompletion
   let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe.
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer', 'for': 'python' }
    "    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --clang-completer'}
    Plug 'dense-analysis/ale'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   " Leader key popup menu
    Plug 'liuchengxu/vim-which-key'
    Plug 'hoob3rt/lualine.nvim'         " Custom statusbar
   " Fzf vim plugin
    Plug 'junegunn/fzf.vim'
   " Colorize nested parentheses
    Plug 'luochen1990/rainbow'
    Plug 'airblade/vim-gitgutter'      " Git, show diff lines
    Plug 'jreybert/vimagit'            " Magit
    Plug 'tpope/vim-surround'          " Vim surround
    Plug 'tpope/vim-fugitive'          " Git status etc
    Plug 'rust-lang/rust.vim'          " Rust support
    Plug 'majutsushi/tagbar'           " Tagbar support as suggested by rust-lang/rust.vim
    Plug 'sevko/vim-nand2tetris-syntax'
    Plug 'neovim/nvim-lspconfig'
    Plug 'rderik/vim-markdown-toc'
call plug#end()


" Background color
set background=dark

" vim-pls config
" let g:asyncomplete_auto_popup = 0
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt=menuone,noinsert,noselect,preview
"
"   Register servers
"       Rust

"      Go
"      Disable for a while
"
" if executable('gopls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd BufWritePre *.go LspDocumentFormatSync
" endif

"   idk what is this


let g:lsp_diagnostics_enabled = 0 " disable diagnostics support

" vim-pls config ^^

" rust-vim
" let g:rustfmt_options = '--edition 2018'


" ale config
" https://github.com/golang/tools/blob/master/gopls/doc/vim.md
"let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet', 'gopls']}
"let g:ale_linters = {'go': ['gopls']}
"let g:ale_go_gopls_options = ''
let g:ale_linters = {'rust': ['rustc', 'rls'], 'c': ['clangd', 'clang-format', 'clangtidy']}
let g:ale_c_parse_makefile = 1
" let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet']}
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" Look and feel
"
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
set softtabstop=4
" On pressing tab, insert 4 spaces
set expandtab
" Set up persistent undo across all files.
set undofile
let b:man_default_sects = '2,3'
au FileType c let b:man_default_sects = '2,3'
"   Highlight whitespaces
highlight ExtraWhitespace ctermbg=blue guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


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

" 
" https://stackoverflow.com/questions/14641942/how-to-unmap-tab-and-do-not-make-ctrl-i-invalid-in-vim
" noremap <tab> >>
" noremap <s-tab> <<

function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

"   Navigation
"   Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> :call TmuxMove('h')<cr>
noremap <c-j> :call TmuxMove('j')<cr>
noremap <c-k> :call TmuxMove('k')<cr>
noremap <c-l> :call TmuxMove('l')<cr>
"   Fast buffer navigation with <Alt> + hl
noremap <a-l> :bn<cr>
noremap <a-h> :bp<cr>
noremap <leader><tab> :b#<cr>

"   Leader mappings
"   b-key
noremap <leader>bb :Buffer<cr>
noremap <leader>bd :Bd<cr>
noremap <leader>bD :w<cr>:Bd<cr>
"   e-key
noremap <leader>en :ALENextWrap<cr>
noremap <leader>ep :ALEPreviousWrap<cr>
"   f-key
noremap <leader>fed :e $MYVIMRC<cr>
noremap <leader>fel :e $HOME/.config/nvim/ftplugin<cr>
noremap <leader>fer :so $MYVIMRC<cr>
noremap <leader>fec :e $HOME/.config<cr>
noremap <leader>ft :NERDTreeToggle<cr>
noremap <leader>fs :w<cr>
noremap <leader>fS :wa<cr>
noremap <leader>ff :FZF<cr>
"   m-key
noremap <leader>mp :vertical Man<cr>
"   t-key (tabs)
noremap <leader>tn :tabnew<cr>
"   u-key (ui)
noremap <leader>ull :set nu!<cr>
noremap <leader>ulr :set rnu!<cr>
"   w-key
noremap <leader>wn :vnew<cr>
noremap <leader>wN :new<cr>
"   q-key
noremap <leader>qq :q<cr>
noremap <leader>qQ :wq<cr>
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

lua << EOF
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', '<space>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', '<space>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ tabSize = 4 })<CR>", opts)

    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = { "clangd", "gopls", "pylsp" }
    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
        })
        vim.lsp.enable(lsp)
    end
    require('lualine').setup {
        options = { theme = 'gruvbox' }
    }
EOF

