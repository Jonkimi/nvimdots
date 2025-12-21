local bind = require("keymap.bind")
local map_callback = bind.map_callback

-- delete nvim tree keymap
vim.api.nvim_del_keymap("n", "<leader>nr")

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
	

	-- flash
	["o|r"] = {
		cmd = "",
		options = {
			callback = function()
				require("flash").remote()
			end,
			noremap = true,
			silent = true,
			desc = "Remote Flash",
		},
	},
	["ox|R"] = {
		cmd = "",
		options = {
			callback = function()
				require("flash").treesitter_search({
					-- remote treesitter search
					remote_op = { restore = true, motion = true },
				})
			end,
			noremap = true,
			silent = true,
			desc = "Treesitter Search",
		},
	},
	["nxo|s"] = {
		cmd = "",
		options = {
			callback = function()
				require("flash").jump()
			end,
			noremap = true,
			silent = true,
			desc = "Flash",
		},
	},
	["nxo|S"] = {
		cmd = "",
		options = {
			callback = function()
				require("flash").treesitter()
			end,
			noremap = true,
			silent = true,
			desc = "Flash Treesitter",
		},
	},
}

return mappings
