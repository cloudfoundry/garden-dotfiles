" Called after everything just before setting a default colorscheme
" Configure you own bindings or other preferences. e.g.:

" set nonumber " No line numbers
" let g:gitgutter_signs = 0 " No git gutter signs
" let g:SignatureEnabledAtStartup = 0 " Do not show marks
" nmap s :MultipleCursorsFind
" colorscheme hybrid
" let g:lightline['colorscheme'] = 'wombat'
" ...
call camelcasemotion#CreateMotionMappings('<leader>')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore vendor directory
set wildignore+=vendor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration: fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function s:define_fzf_command()
  " Change wildignore into space or | separated groups
  " e.g. .aux .out .toc .jpg .bmp .gif
  " or   .aux$\|.out$\|.toc$\|.jpg$\|.bmp$\|.gif$
  let pats = ['[*\/]*\([?_.0-9A-Za-z]\+\)\([*\/]*\)\(\\\@<!,\|$\)','\\\@<!,', '\.']
  let subs = ['\1\2\3', '\\|', '\\.']
  let expr = substitute(&wig, pats[0], subs[0], 'g')
  let expr = substitute(expr, pats[1], subs[1], 'g')
  let expr = substitute(expr, pats[2], subs[2], 'g')
  let expr = substitute(expr, '\\,', ',', 'g')

  let $FZF_DEFAULT_COMMAND = 'ag . -U -l --hidden --nocolor -g "" |' .
    \ ' grep -v "' . expr . '"'
endfunction
call s:define_fzf_command()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration: deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autocomplete: Do not insert any text for a match until the user selects a
" match from the menu.
set completeopt+=noinsert

inoremap <silent> <CR> <C-r>=<SID>apply_and_close_cr()<CR>
function! s:apply_and_close_cr()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType markdown setlocal spell spelllang=en
autocmd FileType tex setlocal spell spelllang=en
autocmd FileType gitcommit setlocal spell spelllang=en

set nowrap
set noswapfile
set nobackup
set nowb

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Window {{{
" Window Movement
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>
