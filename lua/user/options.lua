local options = {
	-- Example
	autoindent = true,
}

-- 性能优化
-- vim.g.matchup_matchparen_enabled = 0
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 100 -- 毫秒
vim.g.matchup_matchparen_deferred_hide_delay = 100
vim.g.matchup_matchparen_timeout = 20    -- 限制匹配计算耗时不超过 20ms

return options
