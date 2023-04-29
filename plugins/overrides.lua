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
