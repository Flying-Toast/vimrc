" NeoVim specific plugins
if has("nvim")
	Plug 'ncm2/ncm2'
	if executable('dcd-server')
		Plug 'ncm2/ncm2-d', {'for': 'd'}
	endif
	if executable('racer')
		Plug 'ncm2/ncm2-racer', {'for': 'rust'}
	endif
	Plug 'roxma/nvim-yarp'
endif
call plug#end()

" Dont log viminfo
set viminfo=

" truecolor for onedark
if (empty($TMUX))
	if (has("termguicolors"))
		set termguicolors
	endif
endif

syntax on
colorscheme onedark

set shiftwidth=4
set tabstop=4
autocmd BufEnter *.c,*.h setlocal shiftwidth=8 tabstop=8

set number
set rnu

set nowrap

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

set shm+=I

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev Tabf tabf
cnoreabbrev Tabe tabe
cnoreabbrev Tabnew tabnew

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

set path=**

" :f -> :find
cabbrev f <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'find' : 'f')<CR>

map Q <Nop>

let g:netrw_banner=0
let g:netrw_liststyle=3

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
set smartindent
set noexpandtab

function StripTrailingWhitespace()
	if &ft != "markdown"
		%s/\s\+$//e
	endif
endfunction
autocmd BufWritePre * call StripTrailingWhitespace()

highlight link Sneak Normal
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

function EnableDCD()
	if has("nvim") && executable("dcd-server")
		call ncm2#enable_for_buffer()
	endif
endfunction
autocmd BufEnter *.d call EnableDCD()

function SetupRust()
	" Matching <> messes up delimitMate with less-than sign
	setlocal matchpairs-=<:>

	if has("nvim") && executable("racer")
		call ncm2#enable_for_buffer()
	endif
endfunction
autocmd BufEnter *.rs call SetupRust()

set completeopt=noinsert,menuone

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufEnter *.dt set ft=pug
