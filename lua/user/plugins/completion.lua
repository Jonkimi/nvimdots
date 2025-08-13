local completion = {}
-- local use_copilot = require("core.settings").use_copilot

completion["Exafunction/windsurf.nvim"] = {
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			-- Optionally disable cmp source if using virtual text only
			enable_cmp_source = false,
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
					typescript = true,
					vue = true,
					html = true,
					css = true,
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

completion["yetone/avante.nvim"] = {
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
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- add any opts here
		-- for example
		provider = "copilot",
		-- provider = "openai",
		providers = {
			-- openai = {
			-- 	endpoint = "https://bh.jonkimi.com/v1",
			-- 	model = "gpt-4.1"
			-- }
			-- gemini = {
			-- 	endpoint = "https://gemini-proxy.jonkimi.com",
			-- 	model = "gemini-"
			-- }
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
		"folke/snacks.nvim", -- for input provider snacks
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
