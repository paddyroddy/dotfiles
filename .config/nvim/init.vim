" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim

" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" don't create history files
let g:netrw_dirhistmax = 0

" line numbers
set number 

" number of lines offset when jumping
set scrolloff=2

" Tab key enters 4 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 

" Indent new line the same as the preceding line
set autoindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Show character column
highlight ColorColumn ctermbg=DarkBlue
set colorcolumn=80

" specific filetypes
filetype on           	" Enable filetype detection
filetype indent on    	" Enable filetype-specific indenting
filetype plugin on    	" Enable filetype-specific plugins

" spellcheck
set spelllang=en
augroup spellCheck
    autocmd!
    autocmd BufRead,BufNewFile *.tex setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.markdown setlocal spell
    autocmd BufRead,BufNewFile *.txt setlocal spell
    autocmd FileType gitcommit setlocal spell
    " turn off spellcheck for CMakeLists.txt
    autocmd Filetype cmake setlocal nospell
    " Set files with extention of .md as markdown type.
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" Automatic Installation of Vim-Plug
" ---------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ---------------------------------------------------------------------------

" Plugins
" ---------------------------------------------------------------------------
" Specify a idirectory for plugins
call plug#begin('$HOME/.config/nvim/plugged')

" utilities
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode

" colorschemes
Plug 'EdenEast/nightfox.nvim'

" fuzzy find
Plug '$HOME/.fzf'

" ack the_silver_searcher
Plug 'mileszs/ack.vim'

" markdown format
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" markdown preview
Plug 'shime/vim-livedown'

" toml highlighting
Plug 'cespare/vim-toml'

" Initialize plugin system
call plug#end()
" ---------------------------------------------------------------------------

" Colors
" ---------------------------------------------------------------------------
syntax enable
lua << EOF
require("nightfox").setup({
    options = {
        transparent = true,
    }
})
EOF
colorscheme carbonfox
" ---------------------------------------------------------------------------

" Plugins Settings
" ---------------------------------------------------------------------------
" mileszs/ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!

" python-mode/python-mode
let g:pymode_python = 'python3'

" plasticboy/vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" shime/vim-livedown
let g:livedown_autorun = 0
" ---------------------------------------------------------------------------

" Mappings
" ---------------------------------------------------------------------------
" set a map leader for more key combos
let mapleader = ','

" reload config
nnoremap <leader>r :source $MYVIMRC<CR>

"junegunn/fzf
map <leader>f :FZF<CR>

" mileszs/ack.vim
nnoremap <leader>a :Ack!<Space>

augroup mappings
    autocmd!
    " reformat JSON
    :autocmd FileType json nnoremap <buffer> <leader>j :%!python -m json.tool<CR>

    " shime/vim-livedown
    :autocmd FileType markdown nnoremap <buffer> <leader>md :LivedownToggle<CR>
augroup END
" ---------------------------------------------------------------------------
