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
 NeoBundle 'slim-template/vim-slim'
 NeoBundle 'mileszs/ack.vim'
 NeoBundle 'soramugi/auto-ctags.vim'
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
nnoremap <C-Up> gT
nnoremap <C-Down> gt
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
au BufRead,BufNewFile *.md set filetype=markdown

" vim-rspec mappings
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set foldmethod=syntax
set foldlevel=99

let g:ackprg='ag --vimgrep'
let g:ack_use_dispatch=1

"for acn next and previous
noremap <D-j> :cn<CR>
noremap <D-k> :cp<CR>

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
