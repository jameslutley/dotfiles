require('impatient') -- must be setup before loading lua plugins

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single'
  },
  git = {
    clone_timeout = 600 -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
}

return require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim' -- caching / speed optimisation
  use { 'wbthomason/packer.nvim', event = 'VimEnter' } -- plugin manager

  -- Core UI
  use { 'kyazdani42/nvim-web-devicons', after = 'packer.nvim' } -- icons
  use { 'nvim-lualine/lualine.nvim', -- statusline
    after = { 'nvim-web-devicons', 'github-nvim-theme' },
    config = function() require 'config.lualine' end
  }
  use { 'projekt0n/github-nvim-theme', -- github theme
    after = 'packer.nvim',
    config = function() require 'config.github-nvim-theme' end
  }

  -- LSP
  use { 'neovim/nvim-lspconfig', event = 'BufEnter' } -- configs for neovim's LSP client
  use { 'williamboman/nvim-lsp-installer', -- manage LSP servers
    config = function() require 'config.nvim-lsp-installer' end,
    after = 'nvim-lspconfig'
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', -- syntax highlighting
    event = 'VimEnter',
    config = function() require "config.nvim-treesitter" end,
    run = ':TSUpdate'
  }
  use { 'lewis6991/spellsitter.nvim', -- treesitter spell checker
    after = 'nvim-treesitter',
    config = function() require('spellsitter').setup() end
  }

  -- Autocompletion
  use {
    'ms-jpq/coq_nvim', -- autocomplete engine
    branch = 'coq',
    after = 'nvim-lsp-installer',
    run = ':COQdeps',
    config = function() require 'config.coq-nvim' end
  }
  use { 'ms-jpq/coq.artifacts', -- 5,000+ snippets
    run = ':COQdeps',
    after = 'coq_nvim',
    branch = 'artifacts'
  }
  use { 'ms-jpq/coq.thirdparty',
    branch = '3p',
    after = 'coq_nvim',
    config = function()
      require('coq_3p') {
        { src = 'nvimlua', short_name = 'nLUA' }, { src = 'repl' }
      }
    end
  }

  -- Formatting and editing
  use { 'sbdchd/neoformat', -- formats code
    cmd = 'Neoformat',
    setup = function() require 'config.neoformat' end
  }

    setup = function() require 'config.emmet-vim' end
  use { 'mattn/emmet-vim', -- emmet code abbreviations
    event = 'FileType html,css,markdown',
    setup = function() require 'config.emmet-vim' end
  }
  use { 'machakann/vim-sandwich', event = 'VimEnter' } -- surround text helpers
  use { 'terrortylor/nvim-comment', -- commenting shortcuts
    config = function() require('nvim_comment').setup() end,
    cmd = 'CommentToggle'
  }
  use { 'windwp/nvim-autopairs',
    after = 'coq_nvim',
    config = function() require('config.nvim-autopairs') end
  }

  -- Navigation
  use { 'kyazdani42/nvim-tree.lua', -- file tree explorer
    cmd = 'NvimTreeToggle',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require 'config.nvim-tree' end
  }
  use {
    'vimwiki/vimwiki',
    cmd = 'VimwikiIndex',
    setup = function() require 'config.vimwiki' end
  }
  use { 'andymass/vim-matchup', -- matching parenthesis and more
    after = 'nvim-treesitter',
    config = function() require 'config.vim-matchup' end
  }
  use { 'nvim-telescope/telescope.nvim', -- fuzzy finder in popover with previews
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'ElPiloto/telescope-vimwiki.nvim' },
    cmd = { 'Telescope', 'Telescope vimwiki' },
    config = function() require('telescope').load_extension('vimwiki') end
  }
  use { 'preservim/tagbar', cmd = 'TagbarToggle' } -- code tags in sidebar
  use { 'phaazon/hop.nvim', -- vimium style fast navigation
    event = 'VimEnter',
    as = 'hop',
    config = function()
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use { 'alexghergh/nvim-tmux-navigation', -- easy neovim-tmux navigation
    config = function() require('config.nvim-tmux-navigation') end
  }

  -- Eye candy
  use { 'Pocco81/TrueZen.nvim',
    cmd = { 'TZAtaraxis', 'TZFocus', 'TZMinimalist' },
    config = function() require 'config.truezen' end
  }
  use { 'lukas-reineke/indent-blankline.nvim', -- indent guides
    after = { 'nvim-treesitter', 'github-nvim-theme' },
    config = function() require 'config.indent-blankline' end
  }
  use { 'lewis6991/gitsigns.nvim', -- git integration in sidebar
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use {
    'norcalli/nvim-colorizer.lua', -- adds colors to hex codes
    config = function() require'colorizer'.setup() end
  }

  -- Integrations
  use { 'TimUntersberger/neogit', -- git client
    requires = 'nvim-lua/plenary.nvim',
    config = function() require 'config.neogit' end
  }
end)
