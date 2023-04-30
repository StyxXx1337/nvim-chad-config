---@type MappingsConfig

local function termcode(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.esc = {
  -- escaping modes
  i = {
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true }},
  },

  v = {
    ["kj"] = { "<ESC>", "escape virtual mode", opts = { nowait = true }},
  },

  x = {
    ["kj"] = { "<ESC>", "escape visual block mode", opts = { nowait = true }},
  },

  t = {
    -- switch between windows
    ["<C-h>"] = { termcode "<C-\\><C-N<C-w>h", "window left" },
    ["<C-l>"] = { termcode "<C-\\><C-N><C-w>l", "window right" },
    ["<C-j>"] = { termcode "<C-\\><C-N><C-w>j", "window down" },
    ["<C-k>"] = { termcode "<C-\\><C-N><C-w>k", "window up" },
    ["kj"] = { termcode "<C-\\><C-N>", "escape terminal mode" },
  },
}

M.general = {
  n = {
    -- saveing
    ["<leader>w"] = { "<cmd> w <CR>", "-> save file" },
    ["<C-s>"] = { "<cmd> w! <CR>", "save file" },
  },
}

M.tabufline = {
  -- close buffer + hide terminal buffer
  n = {
    ["<leader>q"] = {
    function()
      require("nvchad_ui.tabufline").close_buffer()
    end,
    "-> close buffer",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "-> nvimtree" },

    -- focus
    ["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = { "Find" },
    -- find
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
    -- theme switcher
    ["<leader>fc"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.lsp = {
  n = {
    ["<leader>l"] = { "Lsp" },
    ["<leader>lD"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "lsp diagnostic",
    },

    ["<leader>lq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>lp"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp pretty/formatting",
    },
  },
}

M.git = {
  n = {
    ["<leader>g"] = { "Git" },
    -- add git commands
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    -- ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
    -- Actions

    ["<leader>gd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.colorthemes = {
  n = {
    ["<leader>c"] = { "Chad" },
    ["<leader>ch"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    ["<leader>ct"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme",
    },
  },
}

M.terminal = {
  n = {
    ["<leader>t"] = { "Terminals" },
    ["<leader>ts"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
  t = {
    -- toggle in terminal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

M.options = {
  n = {
    ["<leader>o"] = { "Options" },
    ["<leader>on"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>or"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
    ["<leader>oK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>ok"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.disabled = {
  n = {
  -- General
     -- former number toggle command
    ["<leader>n"] = "",
     -- former relative number toggle command
    ["<leader>rn"] = "",
    ["<leader>x"] = "",
    ["<leader>b"] = "",
  -- lsp
     -- former nvchad renamer
    ["<leader>ra"] = "",
     -- former code action 
    ["<leader>ca"] = "",
     -- former floating diag 
    -- ["<leader>f"] = "",
    ["<leader>D"] = "",
     -- former diag loclist 
    ["<leader>q"] = "",
    -- former lsp format
    ["<leader>fm"] = "",
    -- former folder add 
    ["<leader>wm"] = "",
    -- former folder remove 
    ["<leader>wr"] = "",
    -- former folder add 
    ["<leader>wa"] = "",
    -- former folder list 
    ["<leader>wl"] = "",

  -- Terminal
     -- former new horizontal command
    ["<leader>h"] = "",
     -- former new vertical term command
    ["<leader>v"] = "",
     -- former keymap finding command
    ["<leader>tk"] = "",
     -- 
    ["<A-i>"] = "",

  -- Telescope 
      -- former find git_commit command
    ["<leader>cm"] = "",
      -- former git status command
    ["<leader>gt"] = "",
      -- former git hidden terminal 
    ["<leader>pt"] = "",

  -- WhichKey
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",

  -- Git 
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>td"] = "",
  },
}

-- more keybinds!

return M
