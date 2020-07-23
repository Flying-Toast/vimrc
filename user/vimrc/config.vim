" NeoVim specific plugins
if has("nvim")
	Plug 'ncm2/ncm2'
	if executable('dcd-server')
		Plug 'ncm2/ncm2-d', {'for': 'd'}
		autocmd BufEnter *.d call ncm2#enable_for_buffer()
	endif
	if executable('racer')
		Plug 'ncm2/ncm2-racer', {'for': 'rust'}
		autocmd BufEnter *.rs call ncm2#enable_for_buffer()
	endif
	if system("python -c 'import jedi'") == ""
		Plug 'ncm2/ncm2-jedi', {'for': 'python'}
		autocmd BufEnter *.py call ncm2#enable_for_buffer()
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
let g:lightline = {'colorscheme': 'onedark'}
set showcmd

" make backspace act normally
set backspace=indent,eol,start

" use system clipboard
set clipboard+=unnamedplus

set shm+=I

function CommandAbbrev(from, to)
	execute 'cabbrev ' . a:from . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:to . '" : "' . a:from . '"<CR>'
endfunction

call CommandAbbrev("f", "find")

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

map Q <Nop>

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_bufsettings="noma nomod nowrap ro nobl"

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

highlight link Sneak None
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" Matching <> messes up delimitMate with less-than sign
autocmd FileType rust setlocal matchpairs-=<:>

set completeopt=noinsert,menuone

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufEnter *.dt set ft=pug

nnoremap <Space> :

" TEMP: for breaking the habit
nnoremap : <nop>
