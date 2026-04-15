-- 获取 Mason 的路径（自动适配系统）
local mason_registry = require("mason-registry")
local ra_path = ""

-- 检查 Mason 是否安装了 rust-analyzer
if mason_registry.is_installed("rust_analyzer") then
    local pkg = mason_registry.get_package("rust_analyzer")
    ra_path = pkg:get_install_path() .. "/rust-analyzer"
end

return {
    server = {
        -- 强制让 rustaceanvim 启动 Mason 路径下的二进制文件
        cmd = function()
            if ra_path ~= "" then
                return { ra_path }
            end
            return { "rust-analyzer" } -- 没找到就回退到默认
        end,
        default_settings = {
            ["rust-analyzer"] = {
                -- 2026版高性能配置
                cache = { warmup = true },
                lru = { capacity = 2048 },
                procMacro = { enable = true },
                -- 如果修改检测还是慢，建议关闭保存时自动 check
                checkOnSave = false, 
            },
        },
    },
}

