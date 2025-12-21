local mappings = {

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
