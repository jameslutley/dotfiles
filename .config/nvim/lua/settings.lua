HOME = os.getenv('HOME')

-- Theme
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- Basic settings
vim.opt.autoread = true -- check for changes automatically
vim.opt.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
vim.opt.clipboard = 'unnamedplus' -- enables the clipboard between neovim and other apps
vim.opt.dictionary = '/usr/share/dict/words'
vim.opt.encoding = 'utf-8'
vim.opt.hidden = true -- hide unused buffers – allow buffer switching without saving
vim.opt.history = 100 -- remember N lines in history
vim.opt.lazyredraw = true -- faster scrolling
vim.opt.mouse = 'a' -- enables mouse support
vim.opt.mousefocus = true
vim.opt.spell = true -- spell checking on
vim.opt.spelllang = 'en' -- sets spell language
vim.opt.startofline = true

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

-- Display
vim.opt.shortmess:append({ I = true }) -- remove intro message
vim.opt.completeopt = 'noselect' -- make LSP and COQ play nicely
-- vim.opt.completeopt = 'menuone,noselect' -- make LSP and COQ play nicely
vim.opt.eol = false -- show if there's no eol char
vim.opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
vim.opt.inccommand = 'split' -- show replacements in a split screen, before applying to the file
vim.opt.laststatus = 2 -- always show status line
vim.opt.list = true -- display white characters
vim.opt.listchars = 'tab:»-,trail:·,eol:¬' -- highlight problem whitespace
vim.opt.showmode = false -- disable the mode line, put in statusline instead
vim.opt.scrolljump = 5 -- lines to scroll when cursor leaves screen
vim.opt.scrolloff = 10 -- always show 10 rows from edge of the screen
vim.opt.showbreak= '↪' -- character to show when line is broken
vim.opt.showmatch  = true -- show matching brackets
vim.opt.splitbelow = true -- puts new split to the bottom of the current
vim.opt.splitright = true -- puts new vsplit windows to the right of the current
vim.opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]' -- backspace and cursor keys wrap lines too
vim.opt.winbl = 10 -- set floating window to be slightly transparent
vim.opt.wrap = true -- wrap lines
vim.opt.fillchars = {
  vert = ' ',
  fold = '⠀',
  eob = ' ', -- suppress ~ at EndOfBuffer
  diff = '⣿', -- alternatives = ⣿ ░ ─ ╱
  msgsep = '‾',
  foldopen = '▾',
  foldsep = '│',
  foldclose = '▸',
}

-- Sidebar
vim.opt.modelines = 0
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.showcmd = true -- display command in bottom bar
vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim check

-- Search
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.regexpengine = 1 -- helps to speed up neovim in tmux
vim.opt.smartcase = true -- case insentive unless capitals used in search

-- White characters
vim.opt.autoindent = true
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.shiftwidth = 2 -- indentation rule
vim.opt.smartindent = true
vim.opt.tabstop = 2 -- 1 tab = 2 spaces

-- Backup files
vim.opt.backup = true -- use backup files
vim.opt.backupdir = HOME .. '/.local/share/nvim/backup' -- backups
vim.opt.directory = '/.local/share/nvim/swap' -- swap files
vim.opt.swapfile = false -- do not use swap file
vim.opt.undodir = HOME .. '/.local/share/nvim/undo' -- undo files
vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.undoreload = 10000
vim.opt.writebackup = false

-- Commands mode
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'
vim.opt.wildignorecase = true
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildmode = 'list:longest,full' -- tab complete list matches, then longest common part, then all

-- Leader settings
vim.g.mapleader = ',' -- change leader to a comma
vim.g.maplocalleader = ','

vim.g.python3_host_prog = '/opt/homebrew/opt/python@3.9/libexec/bin/python'
