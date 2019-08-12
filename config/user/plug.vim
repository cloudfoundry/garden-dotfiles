" Add your own plugins
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug '~/my-prototype-plugin'
" ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'ruanyl/vim-gh-line'
Plug 'robertmeta/nofrils'
Plug 'avakhov/vim-yaml'
Plug 'bkad/CamelCaseMotion'

Plug 'scrooloose/nerdtree'
" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeHijackNetrw=0
augroup luan_nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
