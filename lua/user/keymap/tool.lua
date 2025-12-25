local bind = require("keymap.bind")
local map_callback = bind.map_callback

-- delete nvim tree keymap
-- vim.api.nvim_del_keymap("n", "<leader>nr")


-- toggleterm
local function get_term_direction_by_id(id)
	local terminal = require("toggleterm.terminal")
	local term = terminal.get(id)
	if term then
		return term.direction
	end
	return nil
end
local function smart_toggle(num)
	-- local terminal_buf_name = "term://*#toggleterm#" .. num
	-- local current_buf = vim.api.nvim_get_current_buf()
	-- local current_buf_name = vim.api.nvim_buf_get_name(current_buf)

	-- 1. 获取当前所在的窗口是否是 toggleterm
	local current_buf = vim.api.nvim_get_current_buf()
	local is_current_term = vim.bo[current_buf].filetype == "toggleterm"

	-- 2. 核心逻辑
	if is_current_term then
		-- 如果已经在终端里
		local current_id = vim.b.toggle_number -- 获取当前终端的 ID
		local direction = get_term_direction_by_id(current_id)
		if current_id == num then
			-- 如果按下的数字正是当前终端，则关闭它（回到代码）
			-- print("toggle current term")
			-- vim.cmd(num .. "ToggleTerm")
		else
			-- 如果按下的数字是另一个终端，先关闭当前的，再打开目标的
			vim.cmd("ToggleTerm") -- 隐藏当前
			if direction then
				vim.cmd(num .. "ToggleTerm direction=" .. direction) -- 打开目标
			else
				vim.cmd(num .. "ToggleTerm")
			end
		end
	else
		-- print("normal toggle")
		-- 如果在代码区（Normal 模式）
		-- vim.cmd("BufferLineGoToBuffer " .. num)
		-- 1. 检查命令是否存在
		local cmd_exists = vim.fn.exists(":BufferLineGoToBuffer") == 2

		-- 2. 如果命令不存在，尝试手动加载 bufferline
		-- if not cmd_exists then
		-- 	local status_ok, lazy = pcall(require, "lazy")
		-- 	if status_ok then
		-- 		-- 强制加载 bufferline 插件
		-- 		lazy.load({ plugins = { "bufferline.nvim" } })
		-- 		-- 再次确认命令是否现在存在了
		-- 		cmd_exists = vim.fn.exists(":BufferLineGoToBuffer") == 2
		-- 	end
		-- end

		-- 3. 执行跳转逻辑
		if cmd_exists then
			-- 如果命令存在，直接调用
			-- 使用 pcall 捕获可能的执行错误（例如跳转到一个不存在的索引）
			---@diagnostic disable-next-line: param-type-mismatch
			pcall(vim.cmd, "BufferLineGoToBuffer " .. num)
			-- else
			-- 	-- 4. 最终回退方案：如果 bufferline 无法加载或命令仍不存在
			-- 	-- 使用 Neovim 原生的 buffer 跳转（按缓冲区列表顺序）
			-- 	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			-- 	if buffers[index] then
			-- 		vim.cmd("buffer " .. buffers[index].bufnr)
			-- 	end
		end
	end

end
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
	["n|<leader>bd"] = {
		cmd = "<Cmd>BufDel<CR>",
		options = {
			noremap = true,
			silent = true,
			desc = "tool: delete Buffers",
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

	-- toggle term
	["nt|<A-1>"] = {
		cmd = "",
		options = {
			callback = function()
				smart_toggle(1)
			end,
			noremap = true,
			silent = true,
			desc = "Term: Toggle 1",
		},
	},
	["nt|<A-2>"] = {
		cmd = "",
		options = {
			callback = function()
				smart_toggle(2)
			end,
			noremap = true,
			silent = true,
			desc = "Term: Toggle 2",
		},
	},
	["nt|<A-3>"] = {
		cmd = "",
		options = {
			callback = function()
				smart_toggle(3)
			end,
			noremap = true,
			silent = true,
			desc = "Term: Toggle 3",
		},
	},
	["nt|<A-4>"] = {
		cmd = "",
		options = {
			callback = function()
				smart_toggle(4)
			end,
			noremap = true,
			silent = true,
			desc = "Term: Toggle 4",
		},
	},
	["nt|<A-5>"] = {
		cmd = "",
		options = {
			callback = function()
				smart_toggle(5)
			end,
			noremap = true,
			silent = true,
			desc = "Term: Toggle 5",
		},
	},
}

return mappings
