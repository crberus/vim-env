" down with the old; empower the future
set nocompatible

" Pathogen
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = [
    \ 'palenight-theme'
    \ ]

call pathogen#infect()
"execute pathogen#infect()

"" ergonomics
" allow terminal true colors (not supported by Terminal.App)
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" my soul is corrupted
set bg=dark

" Aesthetics
"colorscheme palenight	" https://github.com/drewtempelmeyer/palenight.vim
"colorscheme solarized8_flat
colorscheme dracula
"colorscheme synthwave
"
"Enable true colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"" misc little dumpy crap that doesn't fit well anywhere else
" show the current editing mode in the statusline
set showmode	" show (partial) command in the last line
set showcmd	" don't wrap unless i ask you to
set nowrap	" gimme line numbers unless i ask you not to
set number	" always show tabline
set showtabline=2	" (0:never, 1:if tabs >1, 2:always)
" color the ## column for a visual reminder if running a big terminal
set colorcolumn=79
set cursorline
set cursorcolumn 
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" remap leader to comma
let mapleader=","
" map leader+e to Texplore
"nnoremap <Leader>e :Texplore<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>
" quick leader tab operations
noremap <Leader>tn :tabnew<CR>
noremap <Leader>n :tabnext<CR>
noremap <Leader>p :tabprevious<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>fp :echo expand('%:p')<CR>
noremap <Leader>rp :echo @%<CR>

" modify Explore behaviors
"  when browsing, <cr> will open the file by: new tab
let netrw_browse_split=3

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
" # Show hidden files by default
let NERDTreeShowHidden=1
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeFileLines = 1

" Indentline (https://github.com/Yggdroot/indentLine)
"let g:indentLine_enabled = 1
"
" indentLine will overwrite your "concealcursor" and "conceallevel" with default value:
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2
"
" indentLine will overwrite 'conceal' color with grey by default. If you want to highlight conceal color with your colorscheme, disable by:
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"
" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
"
" Make lines even prettier, but only works with UTF-8 encoded files
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"
" Disable quote concealing in JSON
" https://stackoverflow.com/questions/40601818/vim-displays-json-file-without-any-quotes
" Some of this isn't indentLine, but grouping together since it's logical
let g:indentLine_setConceal = 0
let g:vim_json_conceal=0
let g:vim_json_syntax_conceal = 0
"
" Disable quote concealing in Markdown
let g:markdown_syntax_conceal=0

" GitHub Co-Pilot
" enable copilot for specific file types
let g:copilot_filetypes = {
    \ '*': v:false,
    \ 'javascript': v:true,
    \ 'typescript': v:true,
    \ 'lua': v:false,
    \ 'rust': v:true,
    \ 'bash': v:true,
    \ 'c': v:true,
    \ 'c#': v:true,
    \ 'c++': v:true,
    \ 'cpp': v:true,
    \ 'go': v:true,
    \ 'python': v:true,
    \ 'terraform': v:true,
    \ 'yaml': v:true,
\ }
