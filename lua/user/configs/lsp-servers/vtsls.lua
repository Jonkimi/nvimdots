local util = require("lspconfig.util")

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"

local vtsls_path = mason_registry.get_package("vtsls"):get_install_path()
local typescript_path = vtsls_path .. "/node_modules/@vtsls/language-server/node_modules/typescript"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	enableForWorkspaceTypeScriptVersions = true,
	configNamespace = "typescript",
}
-- vim.notify(vue_language_server_path)
return {
	cmd = { "vtsls", "--stdio" },

	filetypes = {
		"vue",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		typescript = {
			tsdk = typescript_path,
		},
	},
	settings = {
		vtsls = {
			-- fix https://github.com/LazyVim/LazyVim/discussions/3365#discussioncomment-9609508
			autoUseWorkspaceTsdk = true,
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
		javascript = {
			inlayHints = {
				enumMemberValues = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				parameterTypes = {
					enabled = true,
					suppressWhenArgumentMatchesName = true,
				},
				variableTypes = {
					enabled = true,
				},
				parameterNames = { enabled = "all" },
			},
		},
		typescript = {
			inlayHints = {
				enumMemberValues = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				parameterTypes = {
					enabled = true,
					suppressWhenArgumentMatchesName = true,
				},
				variableTypes = {
					enabled = true,
				},
				parameterNames = { enabled = "all" },
			},
		},
	},
	root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
	single_file_support = true,
}
