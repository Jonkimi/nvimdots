return vim.tbl_extend(
	"force",
	require("user.keymap.core"),
	require("user.keymap.editor")
)
