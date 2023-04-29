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
    ["kj"] = { termcode "<C-\\><C-N>", "escape terminal mode" },
  },
}

M.general = {
  n = {
    -- saveing
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
    ["<C-s>"] = { "<cmd> w! <CR>", "save file" },
  },
}

M.tabufline = {
  -- close buffer + hide terminal buffer
  n = {
    ["<leader>c"] = {
    function()
      require("nvchad_ui.tabufline").close_buffer()
    end,
    "close buffer",
    },
  },
}

-- M.lspconfig = {
--   -- TODO: Update the config 
--   plugin = true,
-- }

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

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

M.git = {
  n = {
    ["<leader>g"] = { "Git" },
    -- add git commands
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
  },
}

M.themes = {
  n = {
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme",
    },
  },
}

M.options = {
  n = {
    ["<leader>o"] = { "Options" },
    ["<leader>on"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>or"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
  },
}

M.disabled = {
  n = {
     -- former terminal command
    ["<leader>h"] = "",
     -- former number toggle command
    ["<leader>n"] = "",
     -- former relative number toggle command
    ["<leader>rn"] = "",
     -- former keymap finding command
    ["<leader>tk"] = "",
      -- former find git_commit command
    ["<leader>cm"] = "",
      -- former git status command
    ["<leader>gt"] = "",
  },
}

-- more keybinds!

return M
