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
	["n|V"] = {
		cmd = "maV",
		options = {
			noremap = true,
			silent = true,
			desc = "edit: Start Visual Mode (Line) and Mark",
		},
	},
	["n|<C-v>"] = {
		cmd = "ma<C-v>",
		options = {
			noremap = true,
			silent = true,
			desc = "edit: Start Visual Mode (Block) and Mark",
		},
	},
	["x|<Esc>"] = {
		cmd = "<Esc>`a",
		options = {
			noremap = true,
			silent = true,
			desc = "edit: Exit Visual Mode and Go Back to Mark",
		},
	},

	-- Custom: Map Enter to insert a blank line below without entering Insert mode
	["n|<leader><CR>"] = {
		cmd = "o<Esc>",
		options = {
			noremap = true,
			silent = true,
			desc = "edit: add an empty line below",
		},
	},
}

return mappings
