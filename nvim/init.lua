-- Set global variables

vim.g.mapleader = " "


-- Set options

vim.opt.tabstop = 2               -- Number of space characters per tab
vim.opt.wrap = false              -- No line wrapping
vim.opt.number = true             -- Add line numbers
vim.opt.shiftwidth = 2            -- Number of characters to indent a line
vim.opt.showmode = false          -- Let the lualine plugin handle modes
vim.opt.swapfile = false          -- Prevent neovim from creating various files
vim.opt.hlsearch = false          -- Do not highlight results of previous search
vim.opt.expandtab = true          -- Transform tabs into spaces
vim.opt.smartcase = true          -- Match case when uppercase letters are used...
vim.opt.ignorecase = true         -- Otherwise, ignore case when searching
vim.opt.splitbelow = true         -- Split windows below when splitting horizontally
vim.opt.splitright = true         -- Split windows right when splitting vertically
vim.opt.signcolumn = "yes"        -- Keep space in gutter for diagnostic flags
vim.opt.termguicolors = true      -- Allow more colors for colorscheme
vim.opt.fileencoding = "utf-8"    -- Force utf-8 file encoding
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard


-- Disable netrw in favor of nvim-tree plugin

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Diagnostics

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 100
vim.cmd [[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false }) ]]



-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Setup plugins

require("lazy").setup({
  -- Theme
  {
    "poolside.nvim", 
    dir = "~/Developer/poolside.nvim", 
    dev = true, 
    lazy = false, 
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd.colorscheme("poolside")
      vim.cmd("highlight Normal ctermbg=none guibg=none") -- Make background transparent
    end
  },

  {
    "uloco/bluloco.nvim"
  },

  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim" },
  { "catppuccin/nvim" },

  -- Language Server Protocol (LSP)
  {
    "VonHeikemen/lsp-zero.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Mason",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      {
        "neovim/nvim-lspconfig",
      },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end
      },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      lsp.set_sign_icons({
        error = "",--"⏺",
        warn  = "",--"▲",
        hint  = "",--"■", -- 
        info  = "",--"⏺"  -- U+23FA
      })
      
      vim.cmd [[ sign define DiagnosticSignError texthl= numhl=DiagnosticSignError ]]
      vim.cmd [[ sign define DiagnosticSignWarn texthl= numhl=DiagnosticSignWarn ]]
      vim.cmd [[ sign define DiagnosticSignHint texthl= numhl=DiagnosticSignHint ]]
      vim.cmd [[ sign define DiagnosticSignInfo texthl= numhl=DiagnosticSignInfo ]]
      vim.cmd [[ sign define DiagnosticSignOk texthl= numhl=DiagnosticSignOk ]]

      lsp.setup()
    end
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = true
            }
          }
        }
      })
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          icons_enabled = false,
          component_separators = "",
          section_separators = "",
          always_divide_middle = true,
          theme = 'poolside'
        },
        sections = {
          -- left
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          -- right
          lualine_x = { "filetype" },
          lualine_y = { "location" },
          lualine_z = { "progress" }
        }
      })
    end
  },

  -- Tabs
  --{
  --  "akinsho/bufferline.nvim",
  --  config = function()
  --    require("bufferline").setup({
  --      options = {
  --        mode = "buffers",
  --        offsets = {
  --          { filetype = "NvimTree" }
  --        },
  --      },
  --      highlights = {
  --        buffer_selected = {
  --          italic = false
  --        },
  --        indicator_selected = {
  --          fg = { attribute = "fg", highlight = "Function" },
  --          italic = false
  --        }
  --      }
  --    })
  --  end
  --},

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Pane switching with tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
      vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
      vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
      vim.keymap.set('n', '<leader>fp', telescope.oldfiles, {})
      vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        indent = { enable = true },
        highlight = { enable = true },
        context_commentstring = { enable = true }
      })
    end
  },

  -- dbt
  {
    "PedramNavid/dbtpal",
    init = function()
      local dbt = require("dbtpal")
      dbt.setup({
        path_to_dbt = "dbt",            -- Path to dbt executable
        path_to_dbt_project = "",       -- Path to dbt project, will auto-detect if blank
        path_to_dbt_profiles_dir = ".", -- Path to dbt profiles directory
        extended_path_search = true,    -- Search for ref/source files in macros and models folders
        protect_compiled_files = true   -- Do not modify sql files in target/(compiled|run) folders
      })

      vim.keymap.set("n", "<leader>drf", dbt.run)
      vim.keymap.set("n", "<leader>drp", dbt.run_all)
      vim.keymap.set("n", "<leader>dtf", dbt.test)
      vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)

      require("telescope").load_extension("dbtpal")
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" }
    }
  }
})

