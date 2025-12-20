local bind = require("keymap.bind")
local map_callback = bind.map_callback

-- delete nvim tree keymap
vim.api.nvim_del_keymap('n', '<leader>nr')

local mappings = {
	-- Custom: Save cursor position before visual selection and restore on <Esc>
	["n|<leader>bs"] = {
		cmd = "<Cmd>Telescope scope buffers<CR>",
		options = {
			noremap = true,
			silent = true,
			desc = "tool: Find Scope Buffers",
		},
	},
	["n|<leader>nn"] = {
		cmd = "<Cmd>HopNodes<CR>",
		options = {
			noremap = true,
			silent = true,
			desc = "Hopes Node Jump",
		},
	},
	["n|<leader>nv"] = {
		cmd = "",
		options = {
			callback = function()
				vim.cmd("normal! ma")  -- 跳转到标记 a 的精确位置
				require("flash").treesitter()
			end,
			noremap = true,
			silent = true,
			desc = "Flash Treesitter Visual selection",
		},
	},
	["n|<leader>nf"] = {
		cmd = "",
		options = {
			callback = function()
				vim.cmd("normal! ma")  -- 跳转到标记 a 的精确位置
				require("flash").treesitter_search()
			end,
			noremap = true,
			silent = true,
			desc = "Flash Treesitter Find",
		},
	},
}

return mappings
