-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/bashls.lua
return {
	cmd = { "bash-language-server", "start" },
	-- zsh not supported https://github.com/bash-lsp/bash-language-server/issues/252
	filetypes = { "bash", "sh"},
}
