-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 2. 强制移除颜色支持 (关键步骤)
-- 这会告诉 Neovim 客户端不要向服务器发送颜色请求
-- capabilities.textDocument.colorProvider = nil
-- capabilities.textDocument.documentColorProvider = nil

return {
	-- capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- 修复问题 2: 禁用不支持的颜色查询功能
		client.server_capabilities.colorProvider = false
		-- 禁用 documentColorProvider，防止 Neovim 发送颜色请求
		client.server_capabilities.documentColorProvider = false
	end,
	settings = {
		pylsp = {
			plugins = {
				-- Lint
				ruff = {
					enabled = true,
					lineLength = 130,
					extendSelect = { "I" }, -- 启用 import 排序 (替代 isort)
					format = { "I" }, -- 允许 ruff 进行格式化
				},
				rope = { enabled = false },

				black = { enabled = false },
				pyls_isort = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
}
