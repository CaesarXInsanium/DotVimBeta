"##############################################################################"
" Plugins
""##############################################################################
" must be listed first
call plug#begin()
" Essential
Plug 'vim-fuzzbox/fuzzbox.vim'
Plug 'https://github.com/vim-autoformat/vim-autoformat'
" disabled in Lispy files and markdown
Plug 'LunarWatcher/auto-pairs'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
Plug 'luochen1990/rainbow'
" window automatic resizing. :help lens
Plug 'camspiers/lens.vim'
" :help sneak
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/itchyny/lightline.vim'
" project searcher. very simple, very useful
Plug 'https://github.com/mileszs/ack.vim'
" command runner
Plug 'https://github.com/skywind3000/asyncrun.vim'

" UI
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/bfrg/vim-c-cpp-modern'
" Filetypes
Plug 'HiPhish/guile.vim'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'https://github.com/Tetralux/odin.vim'
Plug 'https://github.com/zah/nim.vim'
Plug 'https://github.com/kaarmu/typst.vim'

"Lisp/Scheme
Plug 'eraserhd/parinfer-rust'
" Colorschemes
Plug 'https://github.com/ayu-theme/ayu-vim.git'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'ericbn/vim-solarized'
Plug 'sainnhe/everforest'
Plug 'https://github.com/nordtheme/vim.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/romainl/flattened'
Plug 'https://github.com/nikolvs/vim-sunbather'
Plug 'https://github.com/nvimdev/oceanic-material'
Plug 'https://github.com/kratuvid/vim9-gruvbox'
" plugins under consideration" vim-slime
call plug#end()
" Builtins
runtime! ftplugin/man.vim
runtime gtags
"###############################################################################
" Options
"###############################################################################
set nocp
set guifont=ZedMono\ Nerd\ Font\ 15
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
set laststatus=2
set noshowmode
" set foldenable should be filetype option
set nofoldenable
set encoding=UTF-8
set clipboard+=unnamedplus

" Buffer Tabs


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

" Appearance
syntax enable
set termguicolors
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
if !has('gui_running')
  hi Normal guibg=NONE ctermbg=NONE
endif
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
"###############################################################################" Variables"###############################################################################
" VARIABLES
"###############################################################################" Variables"###############################################################################


let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'pdflatex'
let g:vim_markdown_fenced_languages = ['csharp=cs,scheme,c,rust,nim,zig,go,lisp,cpp,python,clojure,bash,sh,vimscript']
let g:vim_asciidoctor_fenced_languages = ['csharp=cs,scheme,c,rust,nim,zig,go,lisp,cpp,python,clojure,bash,sh,vimscript']
let g:typst_folding = 1
let g:asciidoc_folding = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_conceal = 3
let g:markdown_folding = 6
let g:markdown_recommended_style = 0

if executable('rg')
  let g:ackprg = 'rg --vimgrep --glob=!tags'
endif

let g:ft_man_open_mode = 'tab'

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }" Plugins
let g:rainbow_active = 1

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
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

noremap <leader>a <cmd>Ack<CR>
noremap <leader>H <cmd>nohlsearch<CR>

" FuzzBox
noremap <Leader>f <cmd>FuzzyFiles<CR>
noremap <Leader>F <cmd>FuzzyGitFiles<CR>
noremap <leader>b <cmd>FuzzyBuffers<CR>
" equivalent fo FZF :History
noremap <leader>d <cmd>FuzzyPrevious<CR>
noremap <leader>B <cmd>FuzzyMru<CR>
noremap <Leader>l <cmd>FuzzyInBuffer<CR>
" noremap <Leader>L <cmd>Lines<CR>
" ALT-A to select all ALT-D to deselect
" use Rg <search-pattern> manually on command line
noremap <Leader>g <cmd>FuzzyGrep<CR>
noremap <leader>m <cmd>FuzzyMarks<CR>
noremap <leader>j <cmd>FuzzyJumps<CR>
noremap <leader>h <cmd>FuzzyHelp<CR>
noremap <leader>t <cmd>FuzzyTags<CR>
noremap <leader>k <cmd>FuzzyQuickfix<CR>

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
" copy to wayland clipoard
