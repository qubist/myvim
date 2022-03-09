" Use 'cg' to exit Input and Command modes
inoremap cg <Esc>
cnoremap cg <c-u><bs>

" Set up tabs correctly
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Emacs-style backwards delete in insert mode
inoremap <C-d> <C-o>x
" Emacs-style go-to-end-of-line in insert mode
inoremap <C-e> <C-o>$
" Emacs-style go-to-beginning-of-line in insert mode
" (This overrides repeating last insert)
inoremap <C-a> <C-o>^
" Emacs-style delete-to-end-of-line insert mode
" (This overrides digraph insertion)
inoremap <C-k> <C-o>d$
" Emacs-style forward and backward in insert mode
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

" Use dark background mode syntax hightliting
syntax enable
set background=dark

colorscheme solarized

" Red comments
" (see https://jameshfisher.com/2014/05/11/your-syntax-highlighter-is-wrong/)
highlight Comment ctermfg=red

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set mouse=a             " Enable mouse usage (all modes)

" Better ruler
" (https://jeffkreeftmeijer.com/vim-number/)
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Always show the status line at the bottom, even if you only have one window
" open.
set laststatus=2

" Intuitive backspace behaviour
set backspace=indent,eol,start

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable arrow keys

noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Up and down arrow keys move lines

nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==

vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

" Better editing for git commit messages
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

" Style git-gutter properly
highlight! link SignColumn LineNr
" Faster git-gutter update
set updatetime=200

" Sneak
" label-mode
let g:sneak#label = 1
" clever-s
let g:sneak#s_next = 1
" Smart case
let g:sneak#use_ic_scs = 0

" Hotkey for Undotree window
nnoremap <C-k> :UndotreeToggle<CR>
" Focus the Undotree window when it appears
let g:undotree_SetFocusWhenToggle = 1
" UndoTree on right
let g:undotree_WindowLayout = 3

" Enable persistent undo between Vim instances
if has("persistent_undo")
   let target_path = expand('~/.vim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
