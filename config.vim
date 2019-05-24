" NeoVim specific plugins
if has("nvim")
	Plug 'ncm2/ncm2'
	Plug 'ncm2/ncm2-d', {'for': 'd'}
	Plug 'roxma/nvim-yarp'
endif
call plug#end()

" Dont log viminfo
set viminfo=

" set truecolor for onedark
if (empty($TMUX))
	if (has("termguicolors"))
		set termguicolors
	endif
endif

" set onedark theme
syntax on
colorscheme onedark

" tabs are 4 columns wide
set shiftwidth=4
set tabstop=4

" relative line numbers
set number
set rnu

" set no line wrapping
set nowrap

" lightline stuff
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
set showcmd

" make backspace act normally
set backspace=indent,eol,start

" use system clipboard
set clipboard+=unnamedplus

" don't show startscreen, just edit new file when vim is opened
set shm+=I

" make `:W` do the same thing as `:w`, etc
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev Tabf tabf
cnoreabbrev Tabe tabe
cnoreabbrev Tabnew tabnew

" NeoVim specific stuff
if has("nvim")
	" use <Esc> to exit terminal-mode
	tnoremap <Esc> <C-\><C-n>

	" use <Esc> to clear search highlighting
	nmap <silent> <Esc> :noh<CR>

	" don't show linenumbers in :terminal mode
	autocmd TermOpen * setlocal nonumber norelativenumber
endif

" use ctrl-s to save
noremap <silent> <C-s> <Esc>:w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

" use [shift]-tab to cycle through tabs
nnoremap <silent> <Tab> :tabnext<CR>
nnoremap <silent> <S-Tab> :tabprevious<CR>

" Recursively search for files in subdirs
set path+=**

" :f -> :find
cabbrev f <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'find' : 'f')<CR>

" disable ex mode
map Q <Nop>

" netrw - remove banner and show project tree
let g:netrw_banner=0
let g:netrw_liststyle=3

" delimitMate + indentation options
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
set smartindent

" remove trailing whitespace (except on markdown files)
function StripTrailingWhitespace()
	if &ft != "markdown"
		%s/\s\+$//e
	endif
endfunction
autocmd BufWritePre * call StripTrailingWhitespace()

" disable highlighting in vim-sneak, and use s for operators
highlight link Sneak Normal
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" DCD completion stuff
function EnableDCD()
	if has("nvim") && executable("dcd-server")
		call ncm2#enable_for_buffer()
	endif
endfunction
autocmd BufEnter *.d call EnableDCD()

" Completion menu settings
set completeopt=noinsert,menuone

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use pug hightlighting for DIET
autocmd BufEnter *.dt set ft=pug
