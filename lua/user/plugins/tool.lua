local tool = {}

-- 'jghauser/follow-md-links.nvim'
-- https://github.com/jghauser/follow-md-links.nvim
tool["jghauser/follow-md-links.nvim"] = {
    lazy = true,
    -- config = require("tool.follow-md-links"),
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}

-- tool["altermo/ultimate-autopair.nvim"] = {
--     event={'InsertEnter','CmdlineEnter'},
--     branch='v0.6', --recommended as each new version will have breaking changes
--     opts={
--         --Config goes here
--     },
-- }

tool["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = true,
    -- opts = {
    --     check_ts = true,
    --     -- disable_filetype = { "TelescopePrompt" },
    -- },
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}

return tool