local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "c",
    "cpp",
    "starlark",
    "python",
    "rust",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- CPP
    "clangd",
    "clang-format",

    -- Python
    "black",
    "pyright",

    -- Rust 
    "rustfmt",
    "rust-analyzer",
  },
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = require("telescope.actions").cycle_history_next,
        ["<C-p>"] = require("telescope.actions").cycle_history_prev,

        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,

        ["<C-b>"] = require("telescope.actions").results_scrolling_up,
        ["<C-f>"] = require("telescope.actions").results_scrolling_down,

        ["<C-c>"] = require("telescope.actions").close,

        ["<Down>"] = require("telescope.actions").move_selection_next,
        ["<Up>"] = require("telescope.actions").move_selection_previous,

        ["<CR>"] = require("telescope.actions").select_default,
        ["<C-s>"] = require("telescope.actions").select_horizontal,
        ["<C-v>"] = require("telescope.actions").select_vertical,
        ["<C-t>"] = require("telescope.actions").select_tab,
      },
    },
  },
}
-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  view = {
    hide_root_folder = false,
  },

  renderer = {
    root_folder_label = ":~:s?$?/..?",
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
