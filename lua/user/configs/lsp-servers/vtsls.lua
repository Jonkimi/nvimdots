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
	configNamespace = "typescript",
}
-- vim.notify(vue_language_server_path)
return {
	default_config = {
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
				tsserver = {
					globalPlugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							-- location = vue_language_server_path .. "/node_modules/@vue/typescript-plugin",
							languages = { "vue" },
							configNamespace = "typescript",
						},
						-- vue_plugin,
					},
				},
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
				parameterNames = { enabled = "all" },
				parameterTypes = {
					enabled = true,
					suppressWhenArgumentMatchesName = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				variableTypes = {
					enabled = true,
				},
			},
		},
		root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
		single_file_support = true,
	},
	docs = {
		description = [[
https://github.com/yioneko/vtsls

`vtsls` can be installed with npm:
```sh
npm install -g @vtsls/language-server
```

To configure a TypeScript project, add a
[`tsconfig.json`](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html)
or [`jsconfig.json`](https://code.visualstudio.com/docs/languages/jsconfig) to
the root of your project.
]],
	},
}
