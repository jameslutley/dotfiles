" Plugins
" ————————————————————————————————————————
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" call minpac#add('drewtempelmeyer/palenight.vim')        " Palenight color scheme
call minpac#add('haishanh/night-owl.vim')               " Night Owl color scheme
call minpac#add('neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}) " Intellisense engine for neovim
call minpac#add('neoclide/coc-denite')                  " Denite integration for coc.nvim
call minpac#add('Shougo/denite.nvim')                   " Fuzzy search, file management
call minpac#add('scrooloose/nerdtree')                  " File browser
call minpac#add('editorconfig/editorconfig-vim')        " Adds .editorconfig support
call minpac#add('sheerun/vim-polyglot')                 " On demand syntax highlighting
call minpac#add('Yggdroot/indentLine')                  " Line indent guides
call minpac#add('tpope/vim-commentary')                 " Code commenting helpers
call minpac#add('christoomey/vim-tmux-navigator')       " Seamless tmux/vim split navigation
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight') " NERDTree color icons/labels
call minpac#add('tpope/vim-endwise')                    " Auto add `end` to `do` blocks
call minpac#add('mattn/emmet-vim')                      " Adds Emmet support
call minpac#add('ryanoasis/vim-devicons')               " Glyphs/Icons for vim (load this last)
packloadall

" General
" ————————————————————————————————————————
set autoread                                            " Check for changes automatically
au CursorHold * checktime                               " Reload the changes once idle
set mouse=a                                             " Enable mouse support
set mousehide                                           " Hide mouse cursor while typing
set backspace=indent,eol,start                          " Normal backspace behaviour
set spell                                               " Spell checking on
set spelllang=en                                        " Set spell check language
set noswapfile                                          " More trouble than they are worth
set hidden                                              " Allow buffer switching without saving
set laststatus=2                                        " Show the status line
set wrap                                                " Wrap lines
set hlsearch                                            " Highlight search matches
set clipboard=unnamed                                   " Copy from vim to your mac pasteboard
set number                                              " Show line numbers
set notimeout
set ttimeout
set timeoutlen=50                                       " Time to wait after ESC (default causes an annoying delay)
set splitright                                          " Puts new vsplit windows to the right of the current
set splitbelow                                          " Puts new split windows to the bottom of the current
set showmatch                                           " Show matching brackets/parenthesis
set incsearch                                           " Find as you type search
set ignorecase                                          " Needed to enable smartcase (below)
set smartcase                                           " Allows for case insensitive search
set regexpengine=1                                      " Helps to speed up nvim in tmux
set history=1000                                        " Limit history

" Colors & UI
" ————————————————————————————————————————
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"                    " Forces 24-bit neovim colors within tmux
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"                    " Forces 24-bit neovim colors within tmux
set termguicolors                                       " Set 24-bit colors in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark                                     " Dark background
syntax on                                               " Syntax highlighting
" let g:palenight_terminal_italics=1                      " Enable italics in color scheme
" Makes sure Comments text is italic
highlight Comment cterm=italic
" colorscheme palenight
colorscheme night-owl
filetype plugin indent on                               " Automatically detect filetypes
set guifont=IBM\ Plex\ Mono:h15                         " Sets the font
set fillchars+=vert:\                                   " Removes pipes between splits
set splitbelow                                          " Set preview window to appear at bottom
set winbl=10                                            " Set floating window to be slightly transparent
set noshowmode                                          " Disable the mode line (put in statusline instead)

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=None guibg=None
hi! NonText ctermbg=None guibg=None
hi! LineNr ctermfg=None guibg=None
hi! SignColumn ctermfg=None guibg=None
hi! StatusLine ctermfg=None ctermbg=None guibg=#011627 guifg=#eeeeee gui=None cterm=None
hi! StatusLineNC ctermfg=None ctermbg=None guibg=#011627 guifg=#637777 gui=None cterm=None

" Customize NERDTree directory
" hi! NERDTreeCWD guifg=#637777

" Make background color transparent for git changes
hi! SignifySignAdd guibg=None
hi! SignifySignDelete guibg=None
hi! SignifySignChange guibg=None

" Tab completion
" ————————————————————————————————————————
set wildmenu                                            " Show list instead of just completing
set wildmode=list:longest,full                          " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                           " Backspace and cursor keys wrap too
set wildignore+=*/.git/*,*/tmp/*,*.swp,*.o,*.so,*.exe,*.dll
set wildignorecase

" Scroll
" ————————————————————————————————————————
set scrolljump=5                                        " Lines to scroll when cursor leaves screen
set scrolloff=3                                         " Minimum lines to keep above and below cursor

" Whitespace & Special Characters
" ————————————————————————————————————————
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab      " Tabs to spaces
set smarttab smartindent autoindent                     " Automigical indenting
set list                                                " Show hidden characters
set listchars=tab:»-,trail:·,eol:¬                      " Highlight problem whitespace
autocmd BufWritePre * call TrimWhitespace()             " Remove trailing whitespace when saving
function! TrimWhitespace()                              " Trims trailing whitespace
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" Paste
" ————————————————————————————————————————
" Automatically set paste mode when pasting in INSERT mode (tmux compatible)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

if !&readonly && &modifiable
  set fileencoding=utf-8
endif

" Search
" ————————————————————————————————————————
let g:grepper = {'tools': ['git', 'rg', 'vimgrep']}
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build)|(\.(swp|ico|git|svn))$'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Backups
" ————————————————————————————————————————
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" Status Line
" ————————————————————————————————————————
" Dynamically getting the fg/bg colors from the current colorscheme, returns hex which is enough for me to use in Neovim
" Needs to figure out how to return cterm values too
let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")

let g:currentmode={
  \ 'n'  : 'Normal ',
  \ 'no' : 'N·Operator Pending ',
  \ 'v'  : 'Visual ',
  \ 'V'  : 'V·Line ',
  \ '' : 'V·Block ',
  \ 's'  : 'Select ',
  \ 'S'  : 'S·Line ',
  \ '' : 'S·Block ',
  \ 'i'  : 'Insert ',
  \ 'R'  : 'Replace ',
  \ 'Rv' : 'V·Replace ',
  \ 'c'  : 'Command ',
  \ 'cv' : 'Vim Ex ',
  \ 'ce' : 'Ex ',
  \ 'r'  : 'Prompt ',
  \ 'rm' : 'More ',
  \ 'r?' : 'Confirm ',
  \ '!'  : 'Shell ',
  \ 't'  : 'Terminal '
  \}

highlight User1 cterm=None gui=None ctermfg=None guifg=#aaaaaa guibg=None
highlight User2 cterm=None gui=None ctermfg=None guifg=#637777 guibg=None
highlight User3 cterm=None gui=None ctermfg=None guifg=#637777 guibg=None
highlight User4 cterm=None gui=None ctermfg=None guifg=#637777 guibg=None

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=015 guifg=#eeeeee guibg=None gui=None cterm=None'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005 guifg=#addb67 guibg=None gui=None cterm=None'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=#82aaff guibg=None gui=None cterm=None'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=#f78c6c guibg=None gui=None cterm=None'
  endif

  return ''
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set statusline=                                         " Start of left status line
set statusline+=%{ChangeStatuslineColor()}              " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}  " Current mode
set statusline+=%4*\ \ %t\ \                            " File name
set statusline+=%4*\ \ %{StatusDiagnostic()}            " Coc statusline integration
set statusline+=%=                                      " Switch to the right status line
set statusline+=%4*%{&filetype!=''?'\ '.'\ '.&filetype.'\ '.'\ ':''} " File type
set statusline+=%0*\ \ %l/%L\ \                         " Line number

" Keybindings
" ————————————————————————————————————————
noremap ; :

let mapleader=','
let maplocalleader=','

" No arrow keys
map <Left>  :echo " "<cr>
map <Right> :echo " "<cr>
map <Up>    :echo " "<cr>
map <Down>  :echo " "<cr>

" Unset the last search by hitting return
nnoremap <CR> :noh<CR><CR>

" Jump key
nnoremap ` '
nnoremap ' `

" Turn off search highlight
nnoremap <localleader>/ :nohlsearch<CR>

" Trim trailing whitespace
nnoremap <localleader>ws m`:%s/\s\+$//e<CR>``

" Jump to tag with Ctags
nnoremap <leader>, <C-]>

" Coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" Denite shortcuts
nnoremap <leader>. :Denite buffer<cr>
nnoremap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

scriptencoding utf-8

" Define mappings while in 'filter' mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-p>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
endfunction

" Define mappings while in denite window
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-p>
  \ denite#do_map('open_filter_buffer')
endfunction

" Denite
" ————————————————————————————————————————
" See: https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg']) " Use ripgrep in place of 'grep'
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep, via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('buffer', 'date_format', '') " Remove date from buffer list

" Open file commands
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

" Custom options for Denite
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'StatusLine',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" NERDTree
" ————————————————————————————————————————
map <leader>n :NERDTreeToggle<CR>
highlight! link NERDTreeFlags NERDTreeDir
let g:NERDTreeUpdateOnWrite = 1                         " Update NERDTree on any saves
let NERDTreeMinimalUI = 1                               " But with as few features as possible
let NERDTreeMinimalMenu = 1                             " Minimal menu that fits onto one line
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1                              " Quit after opening a file
let NERDTreeShowHidden = 1                              " Show hidden files
let g:NERDTreeHighlightCursorline = 0                   " Makes nerdtree way faster
" let s:colors = palenight#GetColors()                    " Get colors from color scheme
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['blade', 'css', 'erb', 'ex', 'eex', 'hbs', 'html', 'jpg', 'js', 'json', 'jsx', 'markdown', 'md', 'php', 'png', 'py', 'rb', 'sass', 'scss', 'sh', 'slim', 'slime', 'sql', 'vim']

" Icons
" ————————————————————————————————————————
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 0
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " Needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ruby'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['php'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''
let g:WebDevIconsOS = 'Darwin'

" After a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Git
" ————————————————————————————————————————
" Instead of reverting the cursor to the last position in the buffer, we set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Emmet
" ————————————————————————————————————————
let g:user_emmet_leader_key=','                         " Remap trigger key

" Coc Intellisense Engine
" ————————————————————————————————————————
set nobackup                                            " Some servers have issues with backup files, see #649
set nowritebackup                                       " Some servers have issues with backup files, see #649
set cmdheight=1                                         " Only one line for command line
set updatetime=300                                      " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c                                        " Don't give |ins-completion-menu| messages.
set signcolumn=yes                                      " Always show signcolumns

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" Enables coc-pairs auto indent new line on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight symbol under cursor on CursorHold

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Indent Guides
" ————————————————————————————————————————
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#354040'
" let g:indentLine_char = ''
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0

" Update/clean plugins commands
" ————————————————————————————————————————
command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()
