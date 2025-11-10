local tool = {}

-- 'jghauser/follow-md-links.nvim'
-- https://github.com/jghauser/follow-md-links.nvim
tool["jghauser/follow-md-links.nvim"] = {
	lazy = true,
	-- config = require("tool.follow-md-links"),
	ft = "markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}

tool["attilarepka/header.nvim"] = {
	config = true,
	opts = {
		author = "Jonkimi",
	},
}

-- tool["altermo/ultimate-autopair.nvim"] = {
--     event={'InsertEnter','CmdlineEnter'},
--     branch='v0.6', --recommended as each new version will have breaking changes
--     opts={
--         --Config goes here
--     },
-- }

tool["windwp/nvim-autopairs"] = {
	event = "InsertEnter",
	config = true,
	-- opts = {
	--     check_ts = true,
	--     -- disable_filetype = { "TelescopePrompt" },
	-- },
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
}

tool["m4xshen/hardtime.nvim"] = {
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		restricted_keys = {
			["<C-N>"] = {}, -- 移除 <C-N> 的限制
			["C-P"] = {},
		},
	},
}

-- https://github.com/hakonharnes/img-clip.nvim
tool["HakonHarnes/img-clip.nvim"] = {
	event = "VeryLazy",
	opts = {
		default = {
			drag_and_drop = {
				enabled = false, -- 默认禁用
			},
		},
		custom = {
			{
				trigger = function()
					-- 指定文件类型启用
					local allowed_filetypes = { "markdown", "org", "vimwiki", "AvanteInput" }
					local current_ft = vim.bo.filetype
					return vim.tbl_contains(allowed_filetypes, current_ft)
				end,
			},
			drag_and_drop = {
				enabled = true,
			},
		},
	},
	keys = {
		-- suggested keymap
		-- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
return tool
