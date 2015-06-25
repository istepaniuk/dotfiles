" Ivan Stepaniuk
" Partially based on Tobias Schlitt <toby@php.net> .vim files, among others.

" Source local settings
source ~/.vimlocalrc

" Always show statusline
set laststatus=2

" 256 Color terminal when using gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
set t_Co=256

filetype off
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'

Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required



" Show nice info in ruler
set ruler
set laststatus=2


" Tabs
set tabstop=4
set shiftwidth=4
set expandtab


" Search
set incsearch
set hlsearch


" Jump 5 lines when running out of the screen
set scrolljump=5


" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3


" Repair wired terminal/vim settings
set backspace=start,eol,indent


" Allow file inline modelines to provide settings
set modeline


" Line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=239 ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3


" Colors
set background=dark
set noshowmatch
syntax on


" Trailing space marking
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" 80 column marking
set colorcolumn=80
highlight ColorColumn ctermbg=234


" Command aliases
source ~/.vim/cmdalias.vim

call CmdAlias('Q', 'q')
call CmdAlias('W', 'w')
call CmdAlias('Wq', 'wq')
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
vmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <F5> :setlocal spell! spelllang=en_us<cr>

" Disable REPLACE mode
imap <Insert> <Nop>


" Python stuff
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>

let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_select_first = 1
"let g:jedi#goto_command = "<leader>g"
"let g:jedi#get_definition_command = "<leader>d"
let g:jedi#rename_command = "<leader>r"
"let g:jedi#related_names_command = "<leader>n"
"let g:jedi#autocompletion_command = "<C-Space>"
" }}}


autocmd BufNewFile,BufRead *.md set filetype=markdown

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
