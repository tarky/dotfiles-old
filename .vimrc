set guifont=Monaco:h18
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'basyura/unite-rails'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'tpope/vim-endwise'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'tpope/vim-dispatch'
 NeoBundle 'jgdavey/tslime.vim'
 NeoBundle 'thoughtbot/vim-rspec'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle "tyru/caw.vim.git"
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'Align'
 NeoBundle 'plasticboy/vim-markdown'
 NeoBundle 'kannokanno/previm'
 NeoBundle 'tyru/open-browser.vim'
 NeoBundle 'othree/html5.vim'
 NeoBundle 'slim-template/vim-slim'
 NeoBundle 'mileszs/ack.vim'
 NeoBundle 'soramugi/auto-ctags.vim'
 NeoBundle 'sbl/scvim'
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

filetype plugin indent on
syntax on
set number
set ruler
set guifont=Monaco:h16
set columns=116
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set colorcolumn=80
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>m. :<C-u>source $MYVIMRC<Enter>
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
au BufRead,BufNewFile *.md set filetype=markdown

" for vim-dispatch
command C Copen

" vim-rspec mappings
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "Dispatch rspec {spec}"
nmap <Leader>c :call RunCurrentSpecFile()<CR>
nmap <Leader>n :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>
nmap <Leader>m :Dispatch rspec %<CR>

set foldmethod=syntax
set foldlevel=99

let g:ackprg='ag --vimgrep'
let g:ack_use_dispatch=1

"for acn next and previous
noremap <D-j> :cn<CR>
noremap <D-k> :cp<CR>

"for moving window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"for moving tabs
map tn gt
map tp gT
map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt
map t0 :tablast<CR>

"open ctag in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

set mouse=a
set wildmenu

"for neocomplete
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"for open close section
nnoremap <Space> za
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

let g:rails_projections = {
      \ "spec/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/models/%i_test.rb",
      \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ },
      \ "spec/features/*.feature": {
      \   "command":   "feature",
      \   "alternate": "spec/steps/%i_steps.rb",
      \   "template":  "Feature: %h\n  @%i\n  Scenario:",
      \ },
      \ "spec/steps/*_steps.rb": {
      \   "command":   "step",
      \   "alternate": "spec/features/%i.feature",
      \   "template":  " steps_for :%i do\n  step \"\" do ||\n  end\nend",
      \ }
      \}
