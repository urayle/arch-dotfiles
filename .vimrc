"                        _      _             _                    
"  _   _ _ __ __ _ _   _| | ___( )___  __   _(_)_ __ ___  _ __ ___ 
" | | | | '__/ _` | | | | |/ _ \// __| \ \ / / | '_ ` _ \| '__/ __|
" | |_| | | | (_| | |_| | |  __/ \__ \  \ V /| | | | | | | | | (__ 
"  \__,_|_|  \__,_|\__, |_|\___| |___/ (_)_/ |_|_| |_| |_|_|  \___|
"                  |___/                                           

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim' " Colour scheme
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'vim-pandoc/vim-pandoc', {'for': 'rmd'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'rmd'}
call plug#end()

" Basic stuff
filetype plugin on
syntax on
set number
set relativenumber

" Leader key remappings
let maplocalleader = " "

" Set colours
colorscheme nord
highlight Normal ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight Visual ctermbg=240 ctermfg=7
nnoremap <Space>s :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" Additional highlight rules
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Prompt customisation
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
autocmd VimEnter * silent !echo -ne "\e[2 q"

" Change timeout length
set timeoutlen=1000
set ttimeoutlen=5

" Change overflow behaviour with @'s
set display+=lastline

" Clipboard modifications
autocmd VimLeave * call system("xsel -ib", getreg('+')) "Preserve clipboard register when exiting
noremap <Space>y "+y
noremap <Space>p "0p
noremap <Space>P "0P
vnoremap <Space>p "0p

" Disable autocomment
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions -=o

" Tab preferences
set expandtab
set shiftwidth=4
set tabstop=4

" Split preferences
set splitbelow splitright
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l

" Directory payload
nmap <silent> <Space>w :let @+ = "cd " . expand('%:p:h') . "; clear\n"<CR>

" Clear command line
nnoremap <Space>q :<BS>

" Debug key remappings
nnoremap <silent> <Space>n :copen<CR>
nnoremap <silent> <Space>m :cclose<CR>

" Guide navigation
noremap <silent> <Space><Space> <Esc>/<++><CR>c4l
inoremap <silent> ;; <Esc>/<++><CR>c4l
" nnoremap <Space>; ;

" LaTeX compilation and previewing
autocmd Filetype tex set makeprg=texfot\ --quiet\ pdflatex\ %
autocmd Filetype tex set shellpipe=>
autocmd Filetype tex nnoremap <Space>c mr:w<CR>:silent<Space>make<CR>:redraw!<CR>`r
autocmd Filetype tex nnoremap <Space>t :silent<Space>!zathura<Space>%<.pdf<Space>&<CR>

" LaTeX snippets
autocmd FileType tex inoremap ;bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ul \begin{itemize}<CR><CR>\item<Space><CR><CR>\end{itemize}<CR><CR><++><Esc>4kA
autocmd FileType tex inoremap ;ol \begin{enumerate}<CR><CR>\item<Space><CR><CR>\end{enumerate}<CR><CR><++><Esc>4kA
autocmd FileType tex inoremap ;m $$<Space><++><Esc>5hi
autocmd FileType tex inoremap ;al \begin{align*}<CR>\end{align*}<CR><++><Esc>2kA<CR>
autocmd FileType tex inoremap ;fr \frac{}{<++>}<++><Esc>F{T{i
autocmd FileType tex inoremap ;ss \sum_{}^{<++>}<++><Esc>F{T{i

" Nvim-R options and keybindings
let R_rconsole_height = 10
let R_openhtml = 0
let R_after_start = [':norm H']
let R_objbr_place = 'BOTTOM'
nmap <C-j> <Plug>RNextRChunk
nmap <C-k> <Plug>RPreviousRChunk
nmap <C-l> <Plug>RSendChunk
nmap <C-h> <Plug>RDSendLine
vmap <C-h> <Plug>RDSendSelection

" Disabling issues with vim-pandoc
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0

"RMarkdown keybindings
autocmd Filetype rmd inoremap ;m <Space>%>%<Space>
autocmd Filetype rmd nnoremap <Space>H :silent !brave &>/dev/null %<.html &<CR>:redraw!<CR>
