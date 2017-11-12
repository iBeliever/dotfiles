" Load plugins with vim-plug 
call plug#begin()

" Sensible vim defaults
Plug 'tpope/vim-sensible'

" Airline status line (like powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting and error checking
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'vim-syntastic/syntastic'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'ledger/vim-ledger'

Plug 'lervag/vimtex'

call plug#end()

filetype plugin on

" Basic setup
set number
set colorcolumn=80
set textwidth=79

" Let plugins show effects after 500ms, not 4s
set updatetime=500

" Use 4 spaces per tab
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Airline config
let g:airline_powerline_fonts = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Onedark color scheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline_theme='onedark'

syntax on
colorscheme onedark

let g:ledger_maxwidth = 90
let g:ledger_fillstring = '   -'

let g:vim_markdown_folding_level = 3
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

set breakindent

nnoremap Q gq}

function! s:ChangeFormatOption()
    if &filetype == 'markdown'
        if getline(line('.')) =~ '^>'
          setlocal formatoptions+=c
        else
          " Do not automatically insert bullets when auto-wrapping with text-width
          setlocal formatoptions-=c
        endif
    endif
endfunction

augroup MkdFormatOption
    autocmd!
    autocmd CursorMovedI *.m* call s:ChangeFormatOption()
augroup END

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
