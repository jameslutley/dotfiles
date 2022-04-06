vim.api.nvim_set_var('vimwiki_global_ext', 0)
vim.cmd([[
let g:vimwiki_list = [{ 'path': '~/Documents/Personal/Wiki/', 'syntax': 'markdown', 'ext': '.md' }]
]])
-- vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 2
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_auto_header = 1
