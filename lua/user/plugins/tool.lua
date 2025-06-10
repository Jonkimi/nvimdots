local tool = {}

-- 'jghauser/follow-md-links.nvim'
-- https://github.com/jghauser/follow-md-links.nvim
tool["jghauser/follow-md-links.nvim"] = {
    lazy = true,
    -- config = require("tool.follow-md-links"),
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}

return tool