local editor = {}

editor["ojroques/nvim-bufdel"] = {
	-- lazy = true,
	event = "VeryLazy",
	-- cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
	config = function()
		print("nvim-bufdel config")
		require("bufdel").setup({
			next = "tabs",
			quit = false, -- quit Neovim when last buffer is closed
		})
	end,
}
return editor
