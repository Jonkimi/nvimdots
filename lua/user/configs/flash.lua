return {
	modes = {
		search = { enabled = false },
		-- options used when flash is activated through
		-- `f`, `F`, `t`, `T`, `;` and `,` motions
		char = {
			enabled = true,
			-- hide after jump when not using jump labels
			autohide = false,
			-- show jump labels
			jump_labels = true,
			-- set to `false` to use the current line only
			multi_line = true,
			-- When using jump labels, don't use these keys
			-- This allows using those keys directly after the motion
			label = { exclude = "hjkliardc" },
		},
	},
}
