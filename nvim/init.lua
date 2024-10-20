---@diagnostic disable: undefined-global

require("options")

-- Diagnostics

--vim.diagnostic.config({
--  virtual_text = false,
--	signs = true,
--	severity_sort = true,
--	float = {
--		border = "rounded",
--		source = "always",
--	},
--})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
--vim.o.updatetime = 100
--vim.cmd [[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false }) ]]

-- Keyboard shortcuts

vim.keymap.set("n", "<leader><tab>", ":b#<cr>") -- Switch to last open buffer/tab

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
        dir = "~/Developer/poolside.nvim",
        --dev = true,
        lazy = false,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            vim.cmd.colorscheme("poolside")
            vim.cmd("highlight Normal ctermbg=none guibg=none") -- Make background transparent
        end,
    },

    "uloco/bluloco.nvim",
    "rebelot/kanagawa.nvim",
    "rose-pine/neovim",
    "catppuccin/nvim",
    "maxmx03/dracula.nvim",
    "xero/miasma.nvim",
    "kepano/flexoki-neovim",
    "scottmckendry/cyberdream.nvim",

	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },
		},
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				view = {
					side = "right",
					width = 42,
				},
				git = {
					show_on_open_dirs = false,
				},
				modified = {
					enable = true,
					show_on_open_dirs = false,
				},
				renderer = {
					highlight_git = true,
					root_folder_label = ":~:s?$?", -- modified from default ":~:s?$?/..?"
					indent_markers = {
						enable = true,
					},
					icons = {
						webdev_colors = false,
						modified_placement = "signcolumn",
						show = {
							git = false,
						},
					},
				},
				filters = {
					git_ignored = false,
				},
			})
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
				},
				sections = {
					-- left
					lualine_a = {
                        {
                            "mode",
                            fmt = function(res) return " " .. res end
                        }
                    },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
                    -- right
					lualine_x = {
						{
							"filetype",
							colored = false,
						},
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Pane switching with tmux
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	-- Send code from editor to terminal or REPL
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_bracketed_paste = 1
			vim.g.slime_dont_ask_default = 1
			vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
		end,
	},

	---- Quarto
	--{
	--	"quarto-dev/quarto-nvim",
	--	dependencies = {
	--		"jpalardy/vim-slime",
	--		"jmbuhr/otter.nvim",
	--	},
	--	config = function()
	--		require("quarto").setup({
	--			codeRunner = {
	--				enabled = true,
	--				default_method = "slime",
	--			},
	--		})
	--	end,
	--},

	-- Fuzzy finder
    {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					selection_caret = "  ",
					color_devicons = false,
				},
			})

			local telescope = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
			vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
			vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
			vim.keymap.set("n", "<leader>fp", telescope.oldfiles, {})
			vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
		end,
	},

    -- Abstract Syntax Tree (AST)
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
			require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "query", "vim", "vimdoc" },
				auto_install = true,
				indent = {
				    enable = true,
				},
				highlight = {
				    enable = true,
				},
				--context_commentstring = {
				--    enable = true,
				--},
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        node_decremental = "<Leader>sd",
                        scope_incremental = "<Leader>sc",
                    },
                },

                -- Configure settings for "nvim-treesitter/nvim-treesitter-textobjects"
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- Choose the select mode ('v', 'V', or '<c-v>') for a query_string (default is charwise 'v')
                        selection_modes = {
                            ["@parameter.outer"] = "v",
                            ["@function.outer"] = "v",
                            ["@class.outer"] = "<c-v>",
                        },

                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        include_surrounding_whitespace = true,
                    },
                },
            })
		end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.ruff_lsp.setup({})
        end
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function (server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end
    },

	-- Replace UI for messages, cmdline, and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				opts = {
					timeout = 5000,
					render = "minimal",
					stages = "static",
				},
			},
		},
	},

	---- dbt
	--{
	--	"PedramNavid/dbtpal",
	--	dependencies = {
	--		"nvim-lua/plenary.nvim",
	--		"nvim-telescope/telescope.nvim",
	--	},
	--	init = function()
	--		local dbt = require("dbtpal")
	--		dbt.setup({
	--			path_to_dbt = "dbt", -- Path to dbt executable
	--			path_to_dbt_project = "", -- Path to dbt project, will auto-detect if blank
	--			path_to_dbt_profiles_dir = ".", -- Path to dbt profiles directory
	--			extended_path_search = true, -- Search for ref/source files in macros and models folders
	--			protect_compiled_files = true, -- Do not modify sql files in target/(compiled|run) folders
	--		})

	--		vim.keymap.set("n", "<leader>drf", dbt.run)
	--		vim.keymap.set("n", "<leader>drp", dbt.run_all)
	--		vim.keymap.set("n", "<leader>dtf", dbt.test)
	--		vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)

	--		require("telescope").load_extension("dbtpal")
	--	end,
	--},

	{
		"ryanoasis/vim-devicons",
		lazy = false,
	},

    --{
    --    "karb94/neoscroll.nvim",
    --    config = function ()
    --        require('neoscroll').setup({
    --            easing = "quadratic"
    --        })
    --    end
    --},
})
