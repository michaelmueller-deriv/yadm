try
	call plug#begin()
	Plug 'ncm2/ncm2'
        Plug 'ellisonleao/gruvbox.nvim'
        Plug 'roxma/nvim-yarp'
	Plug 'honza/vim-snippets'
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
	Plug 'hoob3rt/lualine.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-fugitive'
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}    
        Plug 'hashivim/vim-terraform'
        Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
        Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
        Plug 'romgrk/barbar.nvim'
        Plug 'nvim-treesitter/nvim-treesitter'
        Plug 'MeanderingProgrammer/render-markdown.nvim'
	call plug#end()


        :if has('win32')
            let g:python3_host_prog='C:\Users\MikeMueller\scoop\apps\python\current\python.exe'
        :else 
            let g:python3_host_prog='/usr/bin/python3'
        :endif

        let mapleader = ","
	nnoremap <leader>fd :CHADopen<CR> 
	nnoremap <F7> :TagbarToggle<CR>
        autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
        command CdCodebase cd ~\source\repos\code-base
        command CdUtils cd ~\source\repos\utilities
        command CdRepos cd ~\source\repos 
        "Telescope
        " Find files using Telescope command-line sugar.
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>
        set termguicolors
augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"

    inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
    " uncomment this block if you use vimtex for LaTex
    " autocmd Filetype tex call ncm2#register_source({
    "           \ 'name': 'vimtex',
    "           \ 'priority': 8,
    "           \ 'scope': ['tex'],
    "           \ 'mark': 'tex',
    "           \ 'word_pattern': '\w+',
    "           \ 'complete_pattern': g:vimtex#re#ncm2,
    "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    "           \ })
augroup END



"Lualine config 
	lua << EOF
        require('render-markdown').setup({
        code = {
            -- Turn on / off code block & inline code rendering
            enabled = false,
            -- Turn on / off any sign column related rendering
            sign = true,
            -- Determines how code blocks & inline code are rendered:
            --  none:     disables all rendering
            --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
            --  language: adds language icon to sign column if enabled and icon + name above code blocks
            --  full:     normal + language
            style = 'full',
            -- Determines where language icon is rendered:
            --  right: right side of code block
            --  left:  left side of code block
            position = 'left',
            -- An array of language names for which background highlighting will be disabled
            -- Likely because that language has background highlights itself
            disable_background = { 'diff' },
            -- Width of the code block background:
            --  block: width of the code block
            --  full:  full width of the window
            width = 'full',
            -- Amount of padding to add to the left of code blocks
            left_pad = 0,
            -- Amount of padding to add to the right of code blocks when width is 'block'
            right_pad = 0,
            -- Minimum width to use for code blocks when width is 'block'
            min_width = 0,
            -- Determins how the top / bottom of code block are rendered:
            --  thick: use the same highlight as the code body
            --  thin:  when lines are empty overlay the above & below icons
            border = 'thin',
            -- Used above code blocks for thin border
            above = '▄',
            -- Used below code blocks for thin border
            below = '▀',
            -- Highlight for code blocks
            highlight = 'RenderMarkdownCode',
            -- Highlight for inline code
            highlight_inline = 'RenderMarkdownCodeInline',
        },

        })
        require('bufferline').setup ({
        options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        --'indicator_icon' will be deprecated: It should be changed to indicator and icon specified as indicator.icon, with
indicator.style = 'icon' 
        indicator = '▎',
        indicator.icon = 'icon',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        color_icons = true , -- whether or not to add the filetype icon highlights
        show_buffer_icons = true , -- disable filetype icons for buffers
        show_buffer_close_icons = true ,
        show_buffer_default_icon = true , -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true ,
        }
        })
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
        
        local lsp = require "lspconfig"
       require("nvim-lsp-installer").setup {}
       require("lspconfig").terraformls.setup{}
    
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
colorscheme gruvbox
"colorscheme code4pay
"Transparent background
"highlight Normal guibg=none
"highlight NonText guibg=none
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
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
set backupdir=~/nvimundo
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

:if has('win32')
    nnoremap ,t :sp<bar>term<cr><c-w>J:resize10<cr> I pwsh<cr>
:else
    nnoremap ,t :sp<bar>term<cr><c-w>J:resize10<cr> I . ~/.bash_profile<cr>
:endif  

"==== End of Non Plugin specific changes ===


