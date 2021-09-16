
try
	call plug#begin()
	"Plug 'roxma/nvim-completion-manager'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	Plug 'ap/vim-buftabline'
	Plug 'majutsushi/tagbar'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-fugitive'
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	call plug#end()


	nnoremap <F4> :CHADopen<CR> 
	nnoremap <F7> :TagbarToggle<CR>
	nnoremap <leader>f :Files<CR>
	nnoremap <leader>a  :Ag <c-r><c-w><cr>
	"Lualine config 
	lua << EOF
	
	local status, lualine = pcall(require, "lualine")
	if (not status) then return end
	lualine.setup {
	  options = {
	    icons_enabled = true,
	    theme = 'everforest',
	    section_separators = {'?', '?'},
	    component_separators = {'?', '?'},
	    disabled_filetypes = {}
	  },
	  sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch'},
	    lualine_c = {'filename'},
	  },
	  inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {'filename'},
	    lualine_x = {'location'},
	    lualine_y = {},
	    lualine_z = {}
	  },
	  tabline = {},
	  extensions = {'fugitive'}
	}

EOF
catch
    "No plugins installed
endtry

" ==== This Section is all the settings that do not require plugins for a
" basic install

set shiftwidth=4
set softtabstop=4
set expandtab
" NetRW remove Banner
let g:netrw_banner = 0

"allow you to move buffers with out having to save them each time.
set hidden
set nu
syn on
:set mouse=a
colorscheme desert
filetype plugin indent on
"Ignore Case in Search
set ignorecase
"smartcase will do case sensitive if mixed charcters used
set smartcase
"use nore regexs for vim not voms crazy ones
nnoremap / /\v
vnoremap / /\v
"show matches incremently
set incsearch
"remap esc to jj
inoremap jj <ESC>
set backupdir=~/vimundo
"persisnent undo files
set undodir=~/nvimundo
set undofile
let mapleader = ","
"kill buffers with out closing windows
 command Bd b#|bd#
"word completion
inoremap <LEADER>c <C-x><C-p>
"open file browser at different locations
nnoremap <F2> :Ex<CR> 
nnoremap <F3> :Ex ~/<CR>
"buffer movment (used with Autohotkey and buftabs)
nnoremap <M-LEFT> :bp<CR>
nnoremap <M-RIGHT> :bn<CR>
tnoremap <M-LEFT> <C-W>:bp<CR>
tnoremap <M-RIGHT> <C-W>:bn<CR> 
tnoremap <C-w> <C-\><C-N><C-w>
inoremap <C-w> <C-\><C-N><C-w>
" Terminal Stuff
nnoremap ,t :sp<bar>term<cr><c-w>J:resize10<cr> I
if has('win32')
    set shell=powershell
endif  

"==== End of Non Plugin specific changes ===


