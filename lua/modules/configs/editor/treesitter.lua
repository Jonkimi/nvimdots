return vim.schedule_wrap(function()
	local use_ssh = require("core.settings").use_ssh

	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require("modules.utils").load_plugin("nvim-treesitter", {
		ensure_installed = require("core.settings").treesitter_deps,
		highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if
					vim.tbl_contains({ "gitcommit" }, ft)
					or (vim.api.nvim_buf_line_count(bufnr) > 7500 and ft ~= "vimdoc")
				then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ak"] = "@class.outer",
					["ik"] = "@class.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["ae"] = "@parameter.outer", -- parameter -> argument
					["ie"] = "@parameter.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["am"] = "@call.outer",
					["im"] = "@call.outer", -- no inner for comment
					["ac"] = "@comment.outer",
					["ic"] = "@comment.outer", -- no inner for comment
					["ah"] = "@assignment.lhs",
					["ar"] = "@assignment.rhs",
					["an"] = "@statement.outer",
					["ai"] = "@conditional.outer",
					["ii"] = "@conditional.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["[["] = "@function.outer",
					["[f"] = "@function.outer",
					["[k"] = "@class.outer",
					["[b"] = "@block.outer",
					["[e"] = "@parameter.inner",
					["[l"] = "@loop.outer",
					["[m"] = "@call.outer",
					["[c"] = "@comment.outer",
					["[h"] = "@assignment.lhs",
					["[r"] = "@assignment.rhs",
				},
				goto_next_end = {
					["[]"] = "@function.outer",
					["[F"] = "@function.outer",
					["[K"] = "@class.outer",
					["[B"] = "@block.outer",
					["[E"] = "@parameter.inner",
					["[L"] = "@loop.outer",
					["[M"] = "@call.outer",
					["[C"] = "@comment.outer",
					["[H"] = "@assignment.lhs",
					["[R"] = "@assignment.rhs",
				},
				goto_previous_start = {
					["]["] = "@function.outer",
					["]f"] = "@function.outer",
					["]k"] = "@class.outer",
					["]b"] = "@block.outer",
					["]e"] = "@parameter.inner",
					["]l"] = "@loop.outer",
					["]m"] = "@call.outer",
					["]c"] = "@comment.outer",
					["]h"] = "@assignment.lhs",
					["]r"] = "@assignment.rhs",
				},
				goto_previous_end = {
					["]]"] = "@function.outer",
					["]F"] = "@function.outer",
					["]K"] = "@class.outer",
					["]B"] = "@block.outer",
					["]E"] = "@parameter.inner",
					["]L"] = "@loop.outer",
					["]M"] = "@call.outer",
					["]C"] = "@comment.outer",
					["]H"] = "@assignment.lhs",
					["]R"] = "@assignment.rhs",
				},
			},
			-- swap = {
			-- 	enable = true,
			-- 	swap_next = {
			-- 		["<leader>a"] = "@parameter.inner",
			-- 		["<leader>m"] = "@function.outer",
			-- 	},
			-- 	swap_previous = {
			-- 		["<leader>A"] = "@parameter.inner",
			-- 		["<leader>M"] = "@function.outer",
			-- 	},
			-- },
		},
		indent = { enable = true },
		matchup = { enable = true },
	}, false, require("nvim-treesitter.configs").setup)
	require("nvim-treesitter.install").prefer_git = true
	if use_ssh then
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		for _, parser in pairs(parsers) do
			parser.install_info.url = parser.install_info.url:gsub("https://github.com/", "git@github.com:")
		end
	end
end)
