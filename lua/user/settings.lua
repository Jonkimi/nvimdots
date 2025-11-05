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
		"tailwindcss",
		-- "denols", -- typescript language server
		-- "ts_ls",
		-- "vuels", -- vetur
		"vtsls",
		"volar", -- volar 2.2.12
		-- "vue_ls", -- volar 3
		"emmet_language_server",
	}
end

-- add null-ls deps
settings["null_ls_deps"] = {
	"black",
}

-- vim.notify("User settings loaded", vim.log.levels.INFO, { title = "user settings load" })

return settings
