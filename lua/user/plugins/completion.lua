local completion = {}

completion["mfussenegger/nvim-jdtls"] = {
	lazy = true,
	ft = "java"
}

completion["JavaHello/spring-boot.nvim"] = {
	lazy = true,
    dependencies = {
    "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
  },
}

return completion