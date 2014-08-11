" Ivan Stepaniuk
" Partially based on Tobias Schlitt <toby@php.net> .vim files, among others.
" No copyright, feel free to use this, as you like, as long as you keep some
" credits.

" Source local settings
source ~/.vimlocalrc

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Set new grep command, which ignores SVN!
" TODO: Add this to SVN
set grepprg=/usr/bin/vimgrep\ $*\ /dev/null

" Map <F5> to turn spelling on (VIM 7.0+)
map <F5> :setlocal spell! spelllang=en_us<cr>

" Highlight current line in insert mode.
" autocmd InsertLeave * se nocul
" autocmd InsertEnter * se cul 

" Reads the skeleton php file
" Note: The normal command afterwards deletes an ugly pending line and moves
" the cursor to the middle of the file.
" autocmd BufNewFile *.php 0r ~/.vim/skeleton.php | normal GddOAOA

" {{{ .phps files handled like .php

au BufRead,BufNewFile *.phps		set filetype=php

" }}}

" {{{  Settings   

" Use filetype plugins, e.g. for PHP
filetype plugin on

" Show nice info in ruler
set ruler
set laststatus=2

" Set standard setting for PEAR coding standards
set tabstop=4
set shiftwidth=4
set expandtab
" Show line numbers by default
" set number

" Enable folding by fold markers
" set foldmethod=marker 

" Autoclose folds, when moving out of them
" set foldclose=all

" Use incremental searching
set incsearch

" Do not highlight search results
set hlsearch

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

syntax on

source ~/.vim/cmdalias.vim

call CmdAlias('Q', 'q')
call CmdAlias('W', 'w')
call CmdAlias('Wq', 'wq')


"source $VIMRUNTIME/mswin.vim


vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
vmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

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
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
