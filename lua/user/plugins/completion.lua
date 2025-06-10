local completion = {}
-- local use_copilot = require("core.settings").use_copilot

completion["Exafunction/windsurf.nvim"] = {
	event = 'BufEnter',
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
					lua= true,
					python= true,
					javascript= true,
					typescript= true,
					vue= true,
					html= true,
					css= true,		
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
				}
			}
        })
    end
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
