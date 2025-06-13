-- vim.notify("Attempting to load user settings", vim.log.levels.INFO, { title = "user settings load" })
-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = true

-- disable github copilot
settings["use_copilot"] = false

-- enable codeium

settings["disabled_plugins"] = {
	"copilot", -- "local-highlight"
}

settings["colorscheme"] = "catppuccin"

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
		"ts_ls",
		"vuels",
	}
end

-- vim.notify("User settings loaded", vim.log.levels.INFO, { title = "user settings load" })

return settings
