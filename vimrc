set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'myint/syntastic-extras'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-utils/vim-man'
Plugin 'pignacio/vim-yapf-format'
Plugin 'psf/black'
Plugin 'roxma/nvim-yarp'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'davidhalter/jedi-vim'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-jedi'
Plugin 'ncm2/ncm2-neosnippet'
Plugin 'ncm2/ncm2-tmux'
" Plugin 'ncm2/ncm2-go'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dracula/vim'
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'

call vundle#end()

syntax on

filetype plugin indent on

au BufRead,BufNewFile *.ds set filetype=xml
au BufRead,BufNewFile *.def set filetype=cpp

set encoding=utf-8

set relativenumber nu

set termguicolors 

" colorscheme ron
" colorscheme dracula
colorscheme gruvbox

set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab
set splitright

set switchbuf=useopen,usetab,newtab

let g:pydoc_cmd="python3 -m pydoc"

" jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'right'

" tagbar
let g:tagbar_position="left"
let g:tagbar_autoclose=1
nnoremap <silent> Q :TagbarToggle<CR>

" nerdtree
nnoremap <silent> <F9> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" neosnippet
inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')

"fzf.vim
nnoremap <silent> <C-P> :GitFiles<CR>
nnoremap <silent> <C-B> :History<CR>

"yapf-format
" au FileType python nnoremap <silent> <buffer> <C-F> :YapfFullFormat<CR>
" black
au FileType python nnoremap <silent> <buffer> <C-F> :Black<CR>

"ncm2
let blacklist = ['cpp', 'hpp', 'go'] 
autocmd BufEnter * if index(blacklist, &ft) < 0 | call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"ycm
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list=1
let g:ycm_python_binary_path='python3'
let g:ycm_filetype_blacklist={ 'python':1 }

"pydoc
let g:pydoc_open_cmd = 'vsp'

"syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_disabled_filetypes = ['cpp' , 'hpp', 'go'] 

let g:syntastic_python_checkers = [ 'mypy', 'pylint'  ] 

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exec = 'pylint'

let g:syntastic_xml_checkers = [ 'xmllint' ] 
let g:syntastic_make_checkers = [ 'gnumake' ] 

"fugitive
set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"airline
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1

highlight LineNr ctermfg=243
highlight CursorLineNr ctermfg=243

command W wa | make -j1

command PrettyFormat execute '%! astyle -A2 -F -S -K -C -q --lineend=linux' | go 1 | %s/{$/{\r/g | %s/\s\+$//e | %s/\n\{3,}/\r\r/e 

command SelToClip execute 'call system("xclip",@0)'

command FixIt YcmCompleter FixIt
