
vim.g.mapleader = " " -- Make spacebar the Vim leader key

vim.g.loaded_netrw = 1 -- Disable netrw to avoid conflict with nvim-tree plugin
vim.g.loaded_netrwPlugin = 1 -- Disable netrw to avoid conflict with nvim-tree plugin

vim.g.omni_sql_no_default_maps = 1 -- Turn off "=sqlcomplete#..." messages: https://stackoverflow.com/questions/24931088/disable-omnicomplete-or-ftplugin-or-something-in-vim

--

vim.opt.wrap = false -- No line wrapping

-- Gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"     -- Make space for diagnostic flags

-- Indentation
vim.opt.expandtab = true  -- Transform tabs into spaces upon file save
vim.opt.tabstop = 4       -- Number of space characters per tab upon file save
vim.opt.shiftwidth = 4    -- Number of space characters per tab when indenting

vim.opt.showcmd = false   -- Don't show commands like ^D/^U when navigating file
vim.opt.showmode = false  -- Let the lualine plugin handle modes
vim.opt.swapfile = false  -- Prevent neovim from creating various files

-- Search
vim.opt.hlsearch = false   -- Do not highlight results of previous search
vim.opt.smartcase = true   -- Match case when uppercase letters are used
vim.opt.ignorecase = true  -- Otherwise, ignore case when searching

-- Splits
vim.opt.splitbelow = true  -- Split windows below when splitting horizontally
vim.opt.splitright = true  -- Split windows right when splitting vertically

vim.opt.termguicolors = true      -- Allow more colors for colorscheme
vim.opt.fileencoding = "utf-8"    -- Force utf-8 file encoding
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard

vim.opt.virtualedit = "block"  -- Allow highlighting non-character cells in Visual Block mode

vim.opt.scrolloff = 999  -- Keep current line in center when scrolling page up or down

vim.opt.inccommand = "split"  -- Forget what this does

-- https://www.reddit.com/r/neovim/comments/14yjoyh/how_to_get_gitsigns_or_equivalent_to_the_right_of/
--vim.opt.statuscolumn = "%=%{v:lnum} %s"  -- Place gutter to right of line numbers
 
-- Set the following to hide almost everything
--vim.opt.signcolumn = "no"
--vim.opt.number = false
vim.opt.ruler = false
vim.opt.laststatus = 0


