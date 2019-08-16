" Called after everything just before setting a default colorscheme
" Configure you own bindings or other preferences. e.g.:

" set nonumber " No line numbers
" let g:gitgutter_signs = 0 " No git gutter signs
" let g:SignatureEnabledAtStartup = 0 " Do not show marks
" nmap s :MultipleCursorsFind
" colorscheme hybrid
" let g:lightline['colorscheme'] = 'wombat'
" ...

" ---------------
" NERDTree
" ---------------
" stop visual-multi clobbering the backslash
let g:VM_leader = '&'

let g:lmap['n'] = { 'name': 'NERDTree' }
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
" call camelcasemotion#CreateMotionMappings('<leader>')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore vendor directory
set wildignore+=vendor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration: fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function s:define_fzf_command()
"   " Change wildignore into space or | separated groups
"   " e.g. .aux .out .toc .jpg .bmp .gif
"   " or   .aux$\|.out$\|.toc$\|.jpg$\|.bmp$\|.gif$
"   let pats = ['[*\/]*\([?_.0-9A-Za-z]\+\)\([*\/]*\)\(\\\@<!,\|$\)','\\\@<!,', '\.']
"   let subs = ['\1\2\3', '\\|', '\\.']
"   let expr = substitute(&wig, pats[0], subs[0], 'g')
"   let expr = substitute(expr, pats[1], subs[1], 'g')
"   let expr = substitute(expr, pats[2], subs[2], 'g')
"   let expr = substitute(expr, '\\,', ',', 'g')

"   let $FZF_DEFAULT_COMMAND = 'ag . -U -l --hidden --nocolor -g "" |' .
"     \ ' grep -v "' . expr . '"'
" endfunction
" call s:define_fzf_command()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration: deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autocomplete: Do not insert any text for a match until the user selects a
" match from the menu.
set completeopt+=noinsert

inoremap <silent> <CR> <C-r>=<SID>apply_and_close_cr()<CR>
function! s:apply_and_close_cr()
  return pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType markdown setlocal spell spelllang=en
autocmd FileType tex setlocal spell spelllang=en
autocmd FileType gitcommit setlocal spell spelllang=en


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Equal Size Windows
let g:lmap['w'] = { 'name': 'Window' }
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" running custom tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ScriptTestTransform(cmd) abort
  let l:command = a:cmd

  if stridx(a:cmd, 'ginkgo') > -1

    let l:commandTail = split(a:cmd)[-1]
    if filereadable('script/test')
      let l:command = 'script/test ' . l:commandTail
    elseif filereadable('scripts/test')
      let l:command = 'scripts/test ' . l:commandTail
    elseif filereadable('scripts/test-unit')
      let l:command = 'scripts/test-unit ' . l:commandTail
    end
  end

  return l:command
endfunction

let g:test#custom_transformations = {'scripttest': function('ScriptTestTransform')}
let g:test#transformation = 'scripttest'
