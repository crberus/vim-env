" down with the old; empower the future
set nocompatible

" enable pathogen
execute pathogen#infect()

"" ergonomics
" allow terminal true colors (not supported by Terminal.App)
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" my soul is corrupted
set bg=dark
" purdiness
colorscheme palenight	" https://github.com/drewtempelmeyer/palenight.vim

"" misc little dumpy crap that doesn't fit well anywhere else
" show the current editing mode in the statusline
set showmode	" show (partial) command in the last line
set showcmd	" don't wrap unless i ask you to
set nowrap	" gimme line numbers unless i ask you not to
set number	" always show tabline
set showtabline=2	" (0:never, 1:if tabs >1, 2:always)
" color the ## column for a visual reminder if running a big terminal
set colorcolumn=79	"

" remap leader to comma
let mapleader=","
" map leader+e to Texplore
nnoremap <Leader>e :Texplore<CR>
" quick leader tab operations
noremap <Leader>tn :tabnew<CR>
noremap <Leader>n :tabnext<CR>
noremap <Leader>p :tabprevious<CR>
noremap <Leader>tc :tabclose<CR>

" (un)comment magikz
let @c=':s/^/#/g'
let @u=':s/^\(\s\{-}\)#/\1/g'

" tabbing-n-things
set tabstop=4	" of spaces a tab counts for (i.e., how to render <Tab>)
set softtabstop=4	" of spaces inserted when <Tab> is hit in INSERT
set shiftwidth=4	" of spaces used for each step of (auto)indent
set expandtab	" use appropriate # of spaces to insert tab in INSERT mode
set autoindent

" enable syntax highlighting & filetype detection
syntax on
" enable advanced syntax aware indenting
filetype off	" required - see immediately following
filetype plugin indent on	" see :help :filetype-overview

" Show trailing whitepace and spaces before a tab using syntax method
hi x104_MediumPurple ctermfg=104 guifg=#8787d7 "rgb=135,135,215
highlight ExtraWhitespace ctermbg=104 guibg=#8787d7
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" normally don't automatically format `text' as it is typed, i.e., only do this
" with comments, at XX characters:
set formatoptions-=t
set textwidth=78

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" folding - <replaced oldschool paramaters with:
" 	https://github.com/tmhedberg/SimpylFold >

" custom, lightweight status line
" from https://dustri.org/b/lightweight-and-sexy-status-bar-in-vim.html
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%{FugitiveStatusline()}
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage
" always show status line
set laststatus=2

" NERDTree (https://github.com/scrooloose/nerdtree)
" # Open automatically with vim every time
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" # Open automatically when opened from a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" # Open on demand via Ctl+n
map <C-n> :NERDTreeToggle<CR>
" # Allow vim to close on a :q if a single NERDTree window is still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
