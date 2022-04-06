require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'github',
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = {{ 'filename', path = 1 }},
    lualine_x = { 'diagnostics' },
    lualine_y = { 'diff', 'branch' },
    lualine_z = { '' }
  },
  extensions = { 'nvim-tree' }
}
