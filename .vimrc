set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'

Bundle 'L9'
Bundle 'FuzzyFinder'

" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

" Rspec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" let g:rspec_command = "Dispatch rspec --drb {spec}"
let g:rspec_command = "Dispatch zeus rspec {spec}"

let &background = "dark"
"hi Comment ctermfg=Blue
"lang messages en_US.UTF-8
set tabstop=2

"disable syntax for really large files
syntax on
syntax enable
set bs=2
set ruler
set showcmd
filetype plugin on
filetype plugin indent on
set incsearch
set autoindent
autocmd FileType text setlocal textwidth=78
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set pastetoggle=<F6>
let javaScript_fold=1
let perl_fold=1
let perl_fold_blocks=1
au BufRead *.html set filetype=htmlm4
"
let Tlist_Ctags_Cmd="exctags"
"set foldcolumn=2
set modelines=10
map  <silent> <F7>    <Esc>:cp<CR>
map  <silent> <F8>    <Esc>:cn<CR>
"set fileencodings=ucs-bom,utf-8,koi8-r

set spelllang=en,ru
"set spellfile=~/.vim/spell.en.utf-8.add
"set spellfile=~/.vim/spell.ru.utf-8.add

au BufNewFile,BufRead /tmp/mutt*  setf mail
au BufNewFile,BufRead /tmp/mutt*  set ai et tw=68 spell

au BufNewFile,BufRead *.go  set filetype=go

" this is for MySQL's 'edit' command while in the client
au! BufRead,BufNewFile /var/tmp/sql* :call SetMySQL()
function! SetMySQL()
    set ft=sql
    SQLSetType mysql
endfunction

set t_ti= t_te=
"set statusline+=%{rvm#statusline()} 
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P 

:nnoremap <F5> :buffers<CR>:buffer<Space>

execute pathogen#infect()

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:ackprg = 'ag --nogroup --nocolor --column'
