require('github-theme').setup {
  -- Change the 'hint' color to the 'orange' color, and make the 'error' color bright red
  -- colors = { hint = 'orange', error = '#ff0000' },
  comment_style = 'italic',
  dark_sidebar = false,
  keyword_style = 'NONE',
  function_style = 'NONE',
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
  theme_style = 'dark_default',
  variable_style = 'NONE',


  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      -- htmlTag = { fg = c.red, bg = '#282c34', sp = c.hint, style = 'underline' },
      DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
      -- this will remove the highlight groups
      -- TSField = {},
    }
  end
}
