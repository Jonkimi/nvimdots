
local mappings = {
	-- Custom: Save cursor position before visual selection and restore on <Esc>
	["n|v"] = {
		cmd = "mav",
		options = {
			noremap = true,
			silent = true,
			desc = "edit: Start Visual Mode and Mark",
		},
	},
	["n|<leader>bs"] = {
		cmd = "<Cmd>Telescope scope buffers<CR>",
		options = {
			noremap = true,
			silent = true,
			desc = "tool: Find Scope Buffers",
		},
	}

}

return mappings
