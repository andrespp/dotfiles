"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""""""""
" My Plugins
"""""""""""""
" Markdown plugin for vim
Plugin 'kannokanno/previm'
" PT BR spell
Bundle 'mateusbraga/vim-spell-pt-br'
" Indent Python
Plugin 'vim-scripts/indentpython.vim'
" Autocompletion
Bundle 'Valloric/YouCompleteMe'
" Syntax Checking
"Plugin 'vim-syntastic/syntastic'
" PEP8 Checking
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set nu
set ignorecase
set noswapfile
set nobackup
set nowritebackup

highlight ColorColumn ctermbg=7
set colorcolumn=80
set encoding=utf-8

"" Split windows navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Enable folding (i.e methods and classes code collaps).
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"" Flag unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" AutoCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Python's specific setup
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
let python_highlight_all=1

"" LaTeX specific setup
au BufNewFile,BufRead *.tex set tabstop=2
au BufNewFile,BufRead *.tex set softtabstop=2
au BufNewFile,BufRead *.tex set shiftwidth=2
au BufNewFile,BufRead *.tex set textwidth=79
au BufNewFile,BufRead *.tex set expandtab
au BufNewFile,BufRead *.tex set autoindent
au BufNewFile,BufRead *.tex set fileformat=unix

"" Web development setup
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set softtabstop=2
au BufNewFile,BufRead *.html set shiftwidth=2
au BufNewFile,BufRead *.html set expandtab
au BufNewFile,BufRead *.html set autoindent
au BufNewFile,BufRead *.css set tabstop=2
au BufNewFile,BufRead *.css set tabstop=2
au BufNewFile,BufRead *.css set softtabstop=2
au BufNewFile,BufRead *.css set shiftwidth=2
au BufNewFile,BufRead *.css set expandtab
au BufNewFile,BufRead *.css set autoindent

"" YAML's specific setup
au BufNewFile,BufRead *.yml set tabstop=2
au BufNewFile,BufRead *.yml set softtabstop=2
au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.yml set textwidth=79
au BufNewFile,BufRead *.yml set expandtab
au BufNewFile,BufRead *.yml set autoindent
au BufNewFile,BufRead *.yml set fileformat=unix
