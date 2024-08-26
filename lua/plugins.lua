local fn = vim.fn
local installPath = DATA_PATH..'/site/pack/packer/start/packer.nvim'


-- install packer if it's not installed already
local packerBootstrap = nil
if fn.empty(fn.glob(installPath)) > 0 then
  packerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', installPath})
  vim.cmd [[packadd packer.nvim]]
end
--
local packer = require('packer').startup(function(use)
  -- Packer should manage itself
  use 'wbthomason/packer.nvim'

  -- git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- prettier with LSP
--  use 'prettier/vim-prettier'

  -- colorscheme(s)
  use 'sainnhe/everforest'

  use 'pappasam/papercolor-theme-slim'

  -- goyo
  use 'junegunn/goyo.vim'

  -- surround vim
  use 'tpope/vim-surround'

  -- nerd commenter
  use 'scrooloose/nerdcommenter'

  -- status line
  use 'glepnir/galaxyline.nvim'

  -- show recent files on empty nvim command
  use 'mhinz/vim-startify'

  -- lsp config
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
require("mason").setup()
require("mason-lspconfig").setup()


require("lspconfig")["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.htmx.setup{}

  -- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}

  -- for LSP autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
--  use 'hrsh8 th/cmp-buffer' -- broken
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'


  -- TODO: prettify telescope vim, make it use regex & shorten the window
  -- telescope - searching / navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- better hotfix window (for showing and searching through results in telescope's find usages)
  -- TODO: learn how to use?
  use {"kevinhwang91/nvim-bqf"}

  -- better highlighting & important for LSPCONFIg autocomplete
   use { 'nvim-treesitter/nvim-treesitter' }
--     run = ':TSUpdate'
-- }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
--    config = function() require'nvim-tree'.setup {} end
  }

  -- prettier tabs
  use 'romgrk/barbar.nvim'

  -- nice diagnostic pane on the bottom
  use 'folke/lsp-trouble.nvim'

  -- support the missing lsp diagnostic colors
  use 'folke/lsp-colors.nvim'

  -- better LSP UI (for code actions, rename etc.)
  use 'tami5/lspsaga.nvim'

  -- show indentation levels
  use 'lukas-reineke/indent-blankline.nvim'

  --- oatmeal llama2 and codellama (openllama run llama2/codellama)
  use {
    "dustinblackman/oatmeal.nvim",
    config = function()
        require("oatmeal").setup({
            backend = "ollama",
            model = "codellama:latest",
        })
    end
  }
  -- highlight variables under cursor
--  use 'RRethy/vim-illuminate'
--
  use 'christoomey/vim-tmux-navigator'

--  use 'norcalli/nvim-colorizer.lua'
-----  vim colors
  use 'gregsexton/Muon'
  use 'dmkc/Underwater-VIM-theme'
  use 'bluz71/vim-nightfly-colors'

--  use {
--  "rest-nvim/rest.nvim",
--  requires = { "nvim-lua/plenary.nvim" },
--  config = function()
--    require("rest-nvim").setup({
--      -- Open request results in a horizontal split
--      result_split_horizontal = false,
--      -- Keep the http file buffer above|left when split horizontal|vertical
--      result_split_in_place = false,
--      -- stay in current windows (.http file) or change to results window (default)
--      stay_in_current_window_after_split = false,
--      -- Skip SSL verification, useful for unknown certificates
--      skip_ssl_verification = false,
--      -- Encode URL before making request
--      encode_url = true,
--      -- Highlight request on run
--      highlight = {
--        enabled = true,
--        timeout = 150,
--      },
--      result = {
--        -- toggle showing URL, HTTP info, headers at top the of result window
--        show_url = true,
--        -- show the generated curl command in case you want to launch
--        -- the same request via the terminal (can be verbose)
--        show_curl_command = false,
--        show_http_info = true,
--        show_headers = true,
--        -- table of curl `--write-out` variables or false if disabled
--        -- for more granular control see Statistics Spec
--        show_statistics = false,
--        -- executables or functions for formatting response body [optional]
--        -- set them to false if you want to disable them
--        formatters = {
--          json = "jq",
--          html = function(body)
--            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
--          end
--        },
--      },
--      -- Jump to request line on run
--      jump_to_request = false,
--      env_file = '.env',
--      -- for telescope select
--      env_pattern = "\\.env$",
--      env_edit_command = "tabedit",
--      custom_dynamic_variables = {},
--      yank_dry_run = true,
--      search_back = true,
--    })
--  end
--}




  -- this will automatically install listed dependencies
  -- only the first time NeoVim is opened, because that's when Packer gets installed
  if packerBootstrap then
    require('packer').sync()
  end
end)



-- plugin specific configs go here
--require 'colorizer'.setup()
--require('plugin-config/goyo')
require('plugin-config/nvim-cmp')
require('plugin-config/telescope')
require('plugin-config/nvim-tree')
require('plugin-config/nvim-treesitter')
require('plugin-config/barbar')
require('plugin-config/lsp-colors')
require('plugin-config/lsp-trouble')
require('plugin-config/lspsaga')
require('plugin-config/galaxyline')
require('plugin-config/gitsigns')
require('plugin-config/indent-guide-lines')
--require('plugin-config/vim-prettier')


return packer
