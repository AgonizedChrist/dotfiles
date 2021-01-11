let mapleader =","
let maplocalleader = "\\"

" Vim-Plug init
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" Vim-Plug Plugins

call plug#begin('~/.config/nvim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'

Plug 'ryanoasis/vim-devicons'

Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'pechorin/any-jump.vim'

Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'pechorin/any-jump.vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
call plug#end()

" Behavior
	syntax on
	set mouse=a
	set encoding=utf-8
	filetype plugin on
	set timeoutlen=500
	set splitbelow splitright
	set foldmethod=indent
	set conceallevel=2
	set autoindent
	set wrap linebreak nolist
	set shortmess+=c
	nnoremap c "_c
	set ignorecase
  set smartcase

" Gruvbox Settings
	let g:gruvbox_material_background = 'medium'
	let g:gruvbox_material_transparent_background = 0
	let g:gruvbox_material_enable_bold = 1
	let g:gruvbox_material_enable_italic = 1

" Sonokai Settings
" styles: default, atlantis, andromeda, shusia, maia
  let g:sonokai_style = 'shusia'
	let g:sonokai_enable_italic = 1
  let g:sonokai_transparent_background = 0
	let g:sonokai_diagnostic_line_highlight = 1

" Edge Settings
" styles: default, aura, neon
  let g:edge_style = 'default'
	let g:edge_enable_italic = 1
  let g:edge_transparent_background = 0
	let g:edge_diagnostic_line_highlight = 1


" vim-interface
	set t_Co=256
	if has('termguicolors')
		set termguicolors
	endif
	set hidden
	set ruler
	set cursorline
	set number relativenumber
	set bg=dark
	colorscheme edge
	set cmdheight=1
	set noshowmode

	" Rust autofmt on save
	let g:rustfmt_autosave = 1

	set nobackup
	set nowritebackup

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Command Completion
	set wildmenu
	set wildmode=longest:full,full

" Clipboard
	set go=a
	set clipboard+=unnamedplus
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	let g:NERDTreeLimitedSyntax = 1
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
	let NERDTreeDirArrowExpandable="\u00a0"
  let NERDTreeDirArrowCollapsible="\u00a0"


" TagBar
	nmap <leader>t :TagbarToggle<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Split Navigation shortcuts
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Keep selection after shift
	vnoremap < <gv
	vnoremap > >gv

" COc Tab Compleltion
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction



" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Markdown
	let g:vimwiki_list = [{'path': '~/vimwiki/',
				\ 'syntax': 'markdown', 'ext': '.md'}]
" GitGutter
	nmap ) <Plug>(GitGutterNextHunk)
	nmap ( <Plug>(GitGutterPrevHunk)
	let g:gitgutter_enabled = 1
	let g:gitgutter_map_keys = 0
	let g:gitgutter_highlight_linenrs = 1

" Goyo
	noremap <leader>g :Goyo<CR>

" Lightline
	let g:lightline = {}
	let g:lightline.enable = {'statusline': 1,'tabline': 1}
	let g:lightline.colorscheme = 'edge'
	let g:lightline.active = { 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ] }
	let g:lightline.tabline= {'left': [ ['buffers'] ],'right': [ ['close'] ]}
	let g:lightline.component_raw = {'buffers': 1}
	let g:lightline.component_expand= {'buffers': 'lightline#bufferline#buffers'}
	let g:lightline.component_type = {'buffers': 'tabsel'}
	let g:lightline.component_function = { 'filetype': 'MyFiletype','fileformat': 'MyFileformat',}
	let g:lightline#bufferline#show_number = 2
	let g:lightline#bufferline#unnamed = "untitled"
	let g:lightline#bufferline#enable_devicons = 1
	let g:lightline#bufferline#unicode_symbols = 1
	let g:lightline#bufferline#clickable = 1

	function! MyFiletype()
	 return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
	endfunction

	function! MyFileformat()
	 return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
	endfunction

" Buffer Mappings
	nmap <Leader>1 <Plug>lightline#bufferline#go(1)
	nmap <Leader>2 <Plug>lightline#bufferline#go(2)
	nmap <Leader>3 <Plug>lightline#bufferline#go(3)
	nmap <Leader>4 <Plug>lightline#bufferline#go(4)
	nmap <Leader>5 <Plug>lightline#bufferline#go(5)
	nmap <Leader>6 <Plug>lightline#bufferline#go(6)
	nmap <Leader>7 <Plug>lightline#bufferline#go(7)
	nmap <Leader>8 <Plug>lightline#bufferline#go(8)
	nmap <Leader>9 <Plug>lightline#bufferline#go(9)
	nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"Buffer Navigation
	noremap <Tab> :bn<CR>
	noremap <S-Tab> :bp<CR>
	noremap <Leader><Tab> :Bw<CR>
	noremap <Leader><S-Tab> :Bw!<CR>
	noremap <C-t> :tabnew split<CR>

set list lcs=tab:\|\ ""
nnoremap <F5> :UndotreeToggle<CR>

" Sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
