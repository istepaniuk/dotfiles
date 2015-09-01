" Ivan Stepaniuk
" No copyright, feel free to use this, as you like, as long as you keep some
" credits.

" Source local settings
source ~/.vimlocalrc

" Remove if your term does not support 256 colors. Shame on you.
set t_Co=256

filetype off
set nocompatible

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'
set laststatus=2
set noshowmode

Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-easytags'
let g:easytags_async = 1

Plugin 'xolox/vim-misc'
Plugin 'klen/python-mode'
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_virtualenv = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_rope = 0 " disable rope completion
let g:pymode_lint_on_write = 0
let g:pymode_lint_cwindow = 0
map <F8> :PymodeLint<CR>

Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#goto_command = "<leader>g"
let g:jedi#rename_command = "<leader>r"

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

call vundle#end()
filetype plugin indent on

" Set new grep command, which ignores SVN!
set grepprg=/usr/bin/vimgrep\ $*\ /dev/null

" Map <F5> to turn spelling on (VIM 7.0+)
map <F5> :setlocal spell! spelllang=en_us<cr>

" Show nice info in ruler
set ruler
set laststatus=2

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Search
set hlsearch
set incsearch

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Allow file inline modelines to provide settings
set modeline
set number
highlight LineNr term=bold cterm=NONE ctermfg=239 ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3
set background=dark
set noshowmatch

" Mark line 80
set colorcolumn=80
highlight ColorColumn ctermbg=234


syntax on

source ~/.vim/cmdalias.vim

call CmdAlias('Q', 'q')
call CmdAlias('W', 'w')
call CmdAlias('Wq', 'wq')

vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
vmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" .md Files are markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Disable the REPLACE mode for the insert key
imap <Insert> <Nop>

" Remeber caret posistion between sessions
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Ammount of lines vim remembers between sessions
set viminfo='200,<200,s10,h
