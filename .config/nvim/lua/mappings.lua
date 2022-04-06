-- Generic Mappings
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true }) -- unset the last search by hitting return
vim.api.nvim_set_keymap('n', '<localleader>', ':nohlsearch<CR>', { noremap = true }) -- turn off search highlight
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true }) -- keep search matches in the middle of the window
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true }) -- reselect visual block after indent/outdent
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
-- undo to the last , . or !
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true })

-- Plugin Mappings

-- Hop
vim.api.nvim_set_keymap('', '<leader>b', ':HopWordBC<cr>', { silent = true }) -- toggle hop
vim.api.nvim_set_keymap('', '<leader>k', ':HopWordAC<cr>', { silent = true })

-- Neoformat
vim.api.nvim_set_keymap('', '<leader>fm', ':Neoformat<cr>', { silent = true }) -- toggle formatter

-- Neogit
vim.api.nvim_set_keymap('', '<leader>gt', ':Neogit commit<cr>', { silent = true }) -- toggle neogit

-- Neovim-Tmux Navigation
vim.api.nvim_set_keymap('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
-- Nvim-comment
vim.api.nvim_set_keymap('', 'gcc', ':CommentToggle<cr>', { silent = true }) -- toggle comment

-- Nvim-Tree
vim.api.nvim_set_keymap('', '<leader>n', ':NvimTreeToggle<cr>', { silent = true })

-- Tagbar
vim.api.nvim_set_keymap('', '<leader>tt', ':TagbarToggle<cr>', { silent = true }) -- toggle tagbar

-- Telescope - find files fast
vim.api.nvim_set_keymap('', '<C-p>', ':Telescope find_files<cr>', { silent = true })
vim.api.nvim_set_keymap('', '<leader>tb', ':Telescope buffers<cr>', { silent = true })
vim.api.nvim_set_keymap('', '<leader>tq', ':Telescope quickfix<cr>', { silent = true })
vim.api.nvim_set_keymap('', '<leader>tdd', ':Telescope lsp_document_diagnostics<cr>', { silent = true })
vim.api.nvim_set_keymap('', '<leader>tdw', ':Telescope lsp_workspace_diagnostics<cr>', { silent = true })

-- Telescope-vimwiki
vim.api.nvim_set_keymap('', '<C-y>', ':Telescope vimwiki<cr>', { silent = true })

-- TrueZen
vim.api.nvim_set_keymap('', '<leader>tz', ':TZAtaraxis<cr>', { silent = true }) -- toggle zen

-- Vimwiki
vim.api.nvim_set_keymap('', '<leader>a', ':VimwikiIndex<cr>', { silent = true }) -- toggle wiki
vim.api.nvim_set_keymap('', '<leader>as', ':VimwikiUISelect<cr>', { silent = true }) -- select wiki
