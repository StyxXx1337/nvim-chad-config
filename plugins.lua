local overrides = require "custom.configs.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {
  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig  
  },

  -- overrde plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
      },
    },
  },

-- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

-- code formatting, linting etc
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   after = "nvim-lspconfig",
  --   config = "custom.configs.null-ls",
  -- },

  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      require "custom.configs.vim-fugitive"
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
    end,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins
