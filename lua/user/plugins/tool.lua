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
	lazy = true,
	event = "VeryLazy",
	config = true,
	opts = {
		author = "Jonkimi",
	},
}
tool["ThePrimeagen/harpoon"] = {
	lazy = true,
	event = "VeryLazy",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- 基础快捷键
		-- <leader>a 标记当前文件
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon Add Buffer" })
		vim.keymap.set("n", "<leader>hc", function()
			harpoon:clear()
		end, { desc = "Harpoon Clear Buffers" })
		-- <C-e> 查看标记列表 (UI)
		vim.keymap.set("n", "<leader>0", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon UI" })

		-- 1-4 核心键位跳转 (大神标准肌肉记忆)
		for i = 1, 4 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Harpoon Mark " .. i })
		end

		-- 切换下一个/上一个标记文件
		vim.keymap.set("n", "<leader>[", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Previous Mark" })
		vim.keymap.set("n", "<leader>]", function()
			harpoon:list():next()
		end, { desc = "Harpoon Next Mark" })
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
-- tool["altermo/ultimate-autopair.nvim"] = {
--     event={'InsertEnter','CmdlineEnter'},
--     branch='v0.6', --recommended as each new version will have breaking changes
--     opts={
--         --Config goes here
--     },
-- }

-- tool["windwp/nvim-autopairs"] = {
-- 	event = "InsertEnter",
-- 	config = true,
-- 	-- opts = {
-- 	--     check_ts = true,
-- 	--     -- disable_filetype = { "TelescopePrompt" },
-- 	-- },
-- 	-- use opts = {} for passing setup options
-- 	-- this is equivalent to setup({}) function
-- }

tool["kylechui/nvim-surround"] = {
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end
}

tool["m4xshen/hardtime.nvim"] = {
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		restricted_keys = {
			["<C-N>"] = {}, -- 移除 <C-N> 的限制
			["C-P"] = {},
		},
	},
}

-- customize vim.ui.* implementation for plugins like NvimTree using vim.ui.*
-- https://github.com/stevearc/dressing.nvim
tool["stevearc/dressing.nvim"] = {
	event = "VeryLazy",
	opts = {
		input = {
			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<C-p>"] = "HistoryPrev",
					["<C-n>"] = "HistoryNext",
				},
			},
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

tool["keaising/im-select.nvim"] = {
	config = function()
		require("im_select").setup({
			default_im_select  = "com.apple.keylayout.ABC",
			default_command = "/usr/local/bin/im-select"
		})
	end
}
return tool
