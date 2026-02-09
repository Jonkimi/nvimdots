local editor = {}

editor["ojroques/nvim-bufdel"] = {
	-- lazy = true,
	event = "VeryLazy",
	-- cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
	config = function()
		require("bufdel").setup({
			next = "tabs",
			quit = false, -- quit Neovim when last buffer is closed
		})
	end,
}
return editor
