"##############################################################################"
" Plugins
""##############################################################################
" must be listed first
call plug#begin()
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" tryouts
Plug 'https://github.com/mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
" :help sneak
Plug 'justinmk/vim-sneak'
" Nerd Commenter
" UI
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
" better highlighting
Plug 'https://github.com/bfrg/vim-c-cpp-modern'
Plug 'https://github.com/itchyny/lightline.vim.git'

" Programming
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/vim-autoformat/vim-autoformat.git'

" Filetypes
Plug 'HiPhish/guile.vim'
" neccesary to go back to doing lisp/scheme coding
Plug 'eraserhd/parinfer-rust', {'do':
      \  'cargo build --release'}
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'https://github.com/Tetralux/odin.vim'
Plug 'https://github.com/code5717/c3.vim.git'
Plug 'https://github.com/zah/nim.vim'
Plug 'https://github.com/kaarmu/typst.vim'

" Colorschemes
Plug 'https://github.com/ayu-theme/ayu-vim.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/sainnhe/everforest.git' "dark version is nice
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/nvimdev/oceanic-material.git'
Plug 'https://github.com/romainl/flattened.git'
Plug 'https://github.com/nordtheme/vim.git'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'https://codeberg.org/mao-yining/vim-catppuccin'
Plug 'https://github.com/kratuvid/vim9-gruvbox.git'
Plug 'https://codeberg.org/lifepillar/vim-solarized8.git'
call plug#end()
" Remember that plugins/gtags.vim provides :Gtags command. Which allows use of
" global and gtags use and commands
" Builtins
runtime! ftplugin/man.vim
"###############################################################################
" Options
"###############################################################################
set nocp
set guifont=Iosevka\ Nerd\ Font\ 16.5
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
set laststatus=2
set noshowmode
" set foldenable should be filetype option
set nofoldenable
set encoding=UTF-8
set clipboard+=unnamedplus

set nonu
set rnu
" Text Tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set smartindent
set autoindent
filetype plugin indent on

set nowrap

set history=666
set timeout
set timeoutlen=3000
set ttimeoutlen=100
set backspace=eol,start,nostop,indent
" Search
set ignorecase
set incsearch
set hlsearch
set incsearch

set grepprg=rg\ --vimgrep\ --glob=!tags
set keywordprg=:Man
set shell=/bin/bash
" Backup
set nobackup
set backupext=.bak
set backupdir=~/.cache/vim
" Mouse
if has('mouse')
  set mouse=nva
endif
" Guides
set colorcolumn=80
set cursorline
set nocursorcolumn
set conceallevel=0


"Session
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal

" Completion
set nospell
set spelllang+=en_us
set dictionary+=spell
set wildmenu
set wildoptions+=fuzzy
set completeopt+=menu,menuone,popup,noselect,noinsert
" :help omnifunc" :help completion" Swap
set directory=~/.cache/vim/

"###############################################################################
" APPEARANCE
"###############################################################################

" hard medium soft
let g:everforest_background = 'hard'
let g:everforest_better_performance = 0
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
let g:oceanic_material_transparent_background = 1
let g:oceanic_material_allow_bold = 1
syntax enable
set termguicolors
set background=dark
colorscheme solarized8
let g:lightline = {
      \ 'colorscheme': 'flattened_dark',
      \ }
hi Normal ctermbg=NONE guibg=NONE
"###############################################################################
" VARIABLES
"###############################################################################

" I like to have default mappings disabled, I CHOOSE the mappings.
let g:gitgutter_map_keys = 0

let g:vim_markdown_fenced_languages = ['csharp=cs,scheme,c,rust,nim,zig,go,lisp,cpp,python,clojure,bash,sh,vimscript']
let g:vim_asciidoctor_fenced_languages = ['csharp=cs,scheme,c,rust,nim,zig,go,lisp,cpp,python,clojure,bash,sh,vimscript']
let g:typst_folding = 1
let g:asciidoc_folding = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_conceal = 3
let g:markdown_folding = 6
let g:markdown_recommended_style = 0
let g:solarized_italics = 1
let g:solarized_termtrans = 0

if executable('rg')
  let g:ackprg = 'rg --vimgrep --glob=!tags'
endif

let g:ft_man_open_mode = 'vert'

let g:rainbow_active = 1
let g:fzf_vim = {}

let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', '-1'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction
" use <Tab> to select items, and then C-q to build quickfix
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'man']
let g:indent_guides_default_mapping = 0

let g:sexp_enable_insert_mode_mappings = 0
"###############################################################################
"" Autocommands
"###############################################################################
" see :help autogroup
augroup vimrcEx" autocmd
au!
autocmd FileType text setlocal textwidth=80
augroup END

autocmd FileType .guile set ft=scheme
" augroup vimreload"  au!"  echo "Call PlugInstall"" augroup END

au FileType rust,vimscript set mps+=<:>
au FileType lisp,scheme set mps-=':'
au BufWrite rust,c,zig,nim,go,markdown :Autoformat
"##############################################################################
"" Keybindings
"##############################################################################
" set map Leader to <Space>
let g:mapleader = " "
let g:localleader = " "

noremap <Leader>sp <cmd>PlugInstall<CR>
noremap <Leader>sP <cmd>PlugClean<CR>
" Vim Bindings" reload
noremap <Leader>qr <cmd>source ~/.vim/vimrc<CR>
noremap <Leader>qc <cmd>Colors<CR>
noremap <Leader>qk <cmd>Maps<CR>
noremap <Leader>ql <cmd>set background=light<CR>
noremap <Leader>qL <cmd>set background=dark<CR>
" Buffer Movement
" Homerow Maps :help fzf-vim
noremap <Leader>f <cmd>FZF<CR>

" git files
noremap <leader>b <cmd>Buffers<CR>
noremap <leader>B <cmd>Windows<CR>
" search in current file
noremap <Leader>l <cmd>BLines<CR>
" search in all opened buffers
noremap <Leader>L <cmd>Lines<CR>
" search word under cursor among project files and instanly opens quickfix
noremap <leader>a <cmd>Ack<CR>
" ALT-A to select all ALT-D to deselect
" use Rg <search-pattern> manually on command line
" :RG will relaunch ripgrep on keystroke
noremap <Leader>g <cmd>RG<CR>
noremap <leader>m <cmd>Marks<CR>
noremap <leader>j <cmd>Jumps<CR>
" search available commands, switche to CMD to run and adquire further
" arguments
noremap <leader><C-j> <cmd>Commands<CR>
" most recent file
noremap <leader>J <cmd>History<CR>
noremap <leader>h <cmd>Helptags<CR>
noremap <leader>H <cmd>nohlsearch<CR>
noremap <leader>t <cmd>Tags<CR>
noremap <leader>. <cmd>History/<CR>

noremap <leader><C-f> <cmd>NERDTreeToggle<CR>

noremap <Leader><Leader> <cmd>tab split<CR>
noremap <Leader>` <cmd>tabnew<CR>
noremap <Leader><Backspace> <cmd>tabclose<CR>
noremap <Leader>= <cmd>tabn<CR>
noremap <Leader>- <cmd>tabprevious<CR>
noremap <Leader>1 <cmd>tabn 1<CR>
noremap <Leader>2 <cmd>tabn 2<CR>
noremap <Leader>3 <cmd>tabn 3<CR>
noremap <Leader>4 <cmd>tabn 4<CR>
noremap <Leader>5 <cmd>tabn 5<CR>
noremap <Leader>6 <cmd>tabn 6<CR>
noremap <Leader>7 <cmd>tabn 7<CR>
noremap <Leader>8 <cmd>tabn 8<CR>
noremap <Leader>9 <cmd>tabn 9<CR>
noremap <Leader>0 <cmd>tabn 0<CR>

" fuck them arrow keys
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

" Quickfix Keybindings
noremap <leader>c <cmd>copen<CR>
noremap <leader>C <cmd>cclose<CR>
noremap ]q <cmd>cnext<CR>
noremap [q <cmd>cprevious<CR>

" Window Resize
noremap <C-w>] <cmd>vertical resize +10<CR>
noremap <C-w>[ <cmd>vertical resize -10<CR>
