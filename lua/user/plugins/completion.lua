local completion = {}

completion["Jonkimi/windsurf.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	-- cmd = { "Codeium" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			-- Optionally disable cmp source if using virtual text only
			enable_cmp_source = false,
			enable_chat = false,
			virtual_text = {
				enabled = true,
				-- These are the defaults

				-- Set to true if you never want completions to be shown automatically.
				manual = false,
				-- A mapping of filetype to true or false, to enable virtual text.
				filetypes = {
					lua = true,
					python = true,
					javascript = true,
					javascriptreact = true,
					typescript = true,
					typescriptreact = true,
					vue = true,
					html = true,
					css = true,
					java = true,
					cpp = true,
					c = true,
				},
				-- Whether to enable virtual text of not for filetypes not specifically listed above.
				default_filetype_enabled = false,
				-- How long to wait (in ms) before requesting completions after typing stops.
				idle_delay = 75,
				-- Priority of the virtual text. This usually ensures that the completions appear on top of
				-- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
				-- desired.
				virtual_text_priority = 65535,
				-- Set to false to disable all key bindings for managing completions.
				map_keys = true,
				-- The key to press when hitting the accept keybinding but no completion is showing.
				-- Defaults to \t normally or <c-n> when a popup is showing.
				accept_fallback = nil,
				-- Key bindings for managing completions in virtual text mode.
				key_bindings = {
					-- Accept the current completion.
					accept = "<Tab>",
					-- Accept the next word.
					accept_word = false,
					-- Accept the next line.
					accept_line = false,
					-- Clear the virtual text.
					clear = false,
					-- Cycle to the next completion.
					next = "<M-]>",
					-- Cycle to the previous completion.
					prev = "<M-[>",
				},
			},
		})
		-- disable codeium by default
		require("codeium").disable()
	end,
}

completion["Jonkimi/avante.nvim"] = {
	--   "yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = function()
		-- conditionally use the correct build system for the current OS
		if vim.fn.has("win32") == 1 then
			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		else
			return "make BUILD_FROM_SOURCE=true"
		end
	end,
	-- lazy = true,
	event = "VeryLazy",
	cmd = { "AvanteAsk", "AvanteChat" }, -- 改用命令触发
	version = false, -- Never set this value to "*"! Never!
	-- config = function(_, opts)
	-- 	print(vim.inspect(opts)) -- 看看这里 var2 是什么时候变掉的
	-- end,
	keys = {
		{
			"<leader>aF",
			function()
				local avante = require("avante")
				local sidebar = require("avante.sidebar")
				avante:open_sidebar()
				avante.get().file_selector:open()
			end,
			desc = "Select file",
		},
		{
			"<leader>a+",
			function()
				local tree_ext = require("avante.extensions.nvim_tree")
				tree_ext.add_file()
			end,
			desc = "Select file in NvimTree",
			ft = "NvimTree",
		},
		{
			"<leader>a-",
			function()
				local tree_ext = require("avante.extensions.nvim_tree")
				tree_ext.remove_file()
			end,
			desc = "Deselect file in NvimTree",
			ft = "NvimTree",
		},
	},
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- add any opts here
		-- for example
		-- mode = "legacy",
		-- provider = "copilot",
		provider = "gemini",
		-- provider = "claude-code",
		-- provider = "openai",
		disabled_tools = {"rag_search", "web_search"},
		providers = {
			openai = {
				endpoint = "https://bh.jonkimi.com/v1",
				model = "gpt-4.1",
			},
			["openai-gpt-4o-mini"] = {
				hide_in_model_selector = true,
			},
			-- gemini = {
			-- 	endpoint = "https://gemini-proxy.jonkimi.com/v1beta/models",
			-- 	model = "gemini-2.0-flash",
			-- 	temperature = 0.3,
			-- },
			copilot = {
				hide_in_model_selector = true, -- 隐藏但不完全禁用
			},
			claude_code = {
				endpoint = "https://foxgpt.jonkimi.com/api/anthropic",
				-- endpoint = "http://127.0.0.1:3000/api/anthropic",
				-- endpoint = "http://127.0.0.1:8000",
				api_key_name = "ANTHROPIC_FOX_API_KEY",
				model = "claude-sonnet-4-5-20250929",
				extra_request_body = {
					temperature = 0.3,
				},
			},
			["claude_code-t"] = {
				__inherited_from = "claude_code",
				-- api_key_name = "ANTHROPIC_FOX_API_KEY",
				model = "claude-sonnet-4-5-20250929",
				extra_request_body = {
					temperature = 1.0,
					thinking = { type = "enabled", budget_tokens = 4000 },
				},
			},
			["claude_code-opus"] = {
				__inherited_from = "claude_code",
				-- api_key_name = "ANTHROPIC_FOX_API_KEY",
				-- model = "claude-opus-4-5-20251101",
				model = "claude-opus-4-6",
				extra_request_body = {
					temperature = 1.0,
					thinking = { type = "enabled", budget_tokens = 31999},
				},
			},
			["claude_code-haiku"] = {
				__inherited_from = "claude_code",
				-- api_key_name = "ANTHROPIC_FOX_API_KEY",
				model = "claude-haiku-4-5-20251001",
				extra_request_body = {
					temperature = 1.0,
					thinking = { type = "enabled", budget_tokens = 4000 },
				},
			},
			claude = {
				hide_in_model_selector = true,
			},
			gemini = {
				endpoint = "https://geminicli-api-opt.jonkimi.com/v1beta/models",
				model = "gemini-2.5-pro",
				temperature = 0.6,
				api_key_name = "GEMINI_API_KEY",
			},
			gemini_3_flash = {
				__inherited_from = "gemini",
				-- endpoint = "https://geminicli-api-opt.jonkimi.com/v1beta/models",
				model = "gemini-3-flash-preview",
				temperature = 0.6,
				-- api_key_name = "GEMINI_API_KEY",
			},
			gemini_3_pro = {
				__inherited_from = "gemini",
				-- endpoint = "https://geminicli-api-opt.jonkimi.com/v1beta/models",
				model = "gemini-3-pro-preview",
				temperature = 0.6,
				-- api_key_name = "GEMINI_API_KEY",
			},
			vertex_claude = {
				hide_in_model_selector = true,
			},
			vertex = {
				hide_in_model_selector = true,
			},
		},
		acp_providers = {
			["claude-code"] = {
				command = "npx",
				args = { "@zed-industries/claude-code-acp" },
				env = {
					NODE_NO_WARNINGS = "1",
					-- ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
					ANTHROPIC_AUTH_TOKEN = os.getenv("ANTHROPIC_AUTH_TOKEN"),
					ANTHROPIC_BASE_URL = os.getenv("ANTHROPIC_BASE_URL"),
				},
			},
		},
		windows = {
			width = 30,
			input = {
				prefix = "> ",
				height = 12, -- 输入框高度（行数）
			},
			selected_files = {
				height = 6, -- 选中文件窗口的最大高度
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		-- "folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

completion["folke/snacks.nvim"] = {
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		-- explorer = { enabled = true },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		-- picker = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
}

-- https://github.com/Exafunction/windsurf.vim
-- completion["Exafunction/windsurf.vim"] = {
-- 	event = 'BufEnter',
-- 	dependencies = {
--         "nvim-lua/plenary.nvim",
--         "hrsh7th/nvim-cmp",
--     },
--     config = function()
-- 		vim.g.codeium_enabled = false
-- 		vim.g.codeium_filetypes_disabled_by_default = true
-- 		vim.g.codeium_filetypes = {
-- 			lua= true,
-- 			python= true,
-- 			javascript= true,
-- 			typescript= true,
-- 			vue= true,
-- 			html= true,
-- 			css= true,
-- 		}
-- 		-- To disable automatic text rendering of suggestions (the gray text that appears for a suggestion)
-- 		-- vim.g.codeium_render = false

--     end
-- }

return completion
