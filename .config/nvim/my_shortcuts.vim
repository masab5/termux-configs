"My binds
let mapleader = " "

"NERDTree settings
"Toggle shortcut
nnoremap <A-f> :NERDTreeToggle<CR>
"Open NERDTree on startup
autocmd VimEnter * NERDTree
"Quit NERDTree automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Line numbers switch between hybrid and normal numbers
nnoremap <F5> :call LineNumber()<cr>
function! LineNumber()
  if(&relativenumber == 1)
    :set norelativenumber
  else
    :set relativenumber  
  endif
endfunction

"Run on terminal without compiler message 
autocmd FileType c nnoremap <leader>r :w<cr> :sp <cr> <C-w>l :!gcc % -o %<<cr>:vert term ./%<<cr>a
"Run in horizontal split terminal with compiler message in quickfix
autocmd FileType c nnoremap <leader>e :w<cr> :sp <cr> <C-w>l :!gcc % -o %<<cr>:vert term ./%<<cr>
"Compile in the vertical split terminal
autocmd FileType c nnoremap <leader>2 :w<cr> :sp <cr> <C-w>l :vert term gcc % -o %<<cr>a
"Just Compile in quickfix
autocmd FileType c nnoremap <leader>3 :w<cr> :!gcc % -o %<<cr>
"Compile and run in quickfix.
autocmd FileType c nnoremap <leader>4 :w<cr> :!gcc % -o %<<cr>:!./%<<cr>
" Run code full screen
autocmd FileType c nnoremap <leader>t :w<cr> :!gcc % -o %<<cr>:vert term ./%<<cr>a



nnoremap <leader>d daw " Delete a word with space d
inoremap jk <esc> " Normal mode with  jk.
nnoremap df ciw " Change in word with df

"Python compiler in tmux pane
nnoremap <leader>r :w <cr> :!echo "%">~/.filename.txt<cr>:!sh ~/Scripts/pycompiler.sh<cr>
