-- vim.notify("Attempting to load user settings", vim.log.levels.INFO, { title = "user settings load" }) Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = true

-- disable github copilot
settings["use_copilot"] = false

-- enable codeium

settings["disabled_plugins"] = {
	"copilot", -- "local-highlight"
}
-- catppuccin
settings["colorscheme"] = "catppuccin-latte"

-- manually format
settings["format_on_save"] = false

settings["treesitter_deps"] = {
	"toml",
	"java",
	"rust",
	"tsx",
	"vue",
	"xml",
	"regex",
	"css",
	"scss",
}

-- override default lsp deps
settings["lsp_deps"] = function(defaults)
	return {
		"bashls",
		"clangd",
		"html",
		"jsonls",
		"lua_ls",
		"pylsp",
		-- "basedpyright", 安装报错，直接 npm install -g basedpyright
		-- "ruff",
		"tailwindcss",
		-- "denols", -- typescript language server
		-- "ts_ls",
		-- "vuels", -- vetur
		"vtsls",
		-- "volar",
		"volar@3.0.8", -- volar 2.2.12
		-- "vue_ls@3.0.8", -- volar 3
		"emmet_language_server",
		"rust_analyzer",
	}
end

-- add null-ls deps
settings["null_ls_deps"] = {
	-- "black",
	-- "ruff"
}

-- disalbe language server formatting
-- 开启 block 后在 formatOnSave 时也会 block
settings["server_formatting_block_list"] = {
	html = true,
	vtsls = true,
	-- pylsp = true,
	-- emmet_language_server = true,
	-- tailwindcss  = true,
}

settings["format_timeout"] = 4000
-- vim.notify("User settings loaded", vim.log.levels.INFO, { title = "user settings load" })

return settings
