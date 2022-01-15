call plug#begin('~/.config/nvim/autoload/plugged')

    " onedark theme
    Plug 'joshdick/onedark.vim'
    " onehalf theme
    Plug 'sonph/onehalf', {'rtp': 'vim'}
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Single Compile
    Plug 'xuhdev/SingleCompile'
    " polyglot better syntax highlighting
    Plug 'sheerun/vim-polyglot'
    " Skeleton templates
    Plug 'noahfrederick/vim-skeleton'

call plug#end()

set number relativenumber

source $HOME/.config/nvim/my_shortcuts.vim
source $HOME/.config/nvim/plug-config/coc.vim

let g:skeleton_template_dir = "$HOME/.config/nvim/templates"

" Theme
syntax on
colorscheme onehalfdark
