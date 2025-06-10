-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/tailwindcss.lua

-- vim.notify("Attempting to load tailwindcss language server", vim.log.levels.INFO, { title = "tailwindcss language server load" })
---@brief
--- https://github.com/tailwindlabs/tailwindcss-intellisense
---
--- Tailwind CSS Language Server can be installed via npm:
---
--- npm install -g @tailwindcss/language-server
---@brief
--- https://github.com/tailwindlabs/tailwindcss-intellisense
---
--- Tailwind CSS Language Server can be installed via npm:
---
--- npm install -g @tailwindcss/language-server
local util = require 'lspconfig.util'

return {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = {
    'aspnetcorerazor', 'astro', 'astro-markdown', 'blade', 'clojure', 'django-html', 'htmldjango',
    'edge', 'eelixir', 'elixir', 'ejs', 'erb', 'eruby', 'gohtml', 'gohtmltmpl', 'haml',
    'handlebars', 'hbs', 'html', 'htmlangular', 'html-eex', 'heex', 'jade', 'leaf', 'liquid',
    'markdown', 'mdx', 'mustache', 'njk', 'nunjucks', 'php', 'razor', 'slim', 'twig',
    'css', 'less', 'postcss', 'sass', 'scss', 'stylus', 'sugarss',
    'javascript', 'javascriptreact', 'reason', 'rescript', 'typescript', 'typescriptreact',
    'vue', 'svelte', 'templ',
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
      includeLanguages = {
        eelixir = 'html-eex',
        elixir = 'phoenix-heex',
        eruby = 'erb',
        heex = 'phoenix-heex',
        htmlangular = 'html',
        templ = 'html',
      },
    },
  },
  before_init = function(_, config)
    if not config.settings then
      config.settings = {}
    end
    if not config.settings.editor then
      config.settings.editor = {}
    end
    if not config.settings.editor.tabSize then
      config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
    end
  end,
  workspace_required = true,
  root_dir = function(fname, on_dir)
    local root_files = {
      -- Generic
      'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts',
      'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts',
      -- Phoenix
      'assets/tailwind.config.js', 'assets/tailwind.config.cjs', 'assets/tailwind.config.mjs', 'assets/tailwind.config.ts',
      -- Django
      'theme/static_src/tailwind.config.js', 'theme/static_src/tailwind.config.cjs', 'theme/static_src/tailwind.config.mjs', 'theme/static_src/tailwind.config.ts',
      'theme/static_src/postcss.config.js',
      -- Rails
      'app/assets/stylesheets/application.tailwind.css', 'app/assets/tailwind/application.css',
    }
    -- vim.notify("Attempting to load tailwindcss language server for " .. fname, vim.log.levels.INFO, { title = "tailwindcss language server load" })
    -- fixbug: 和 package.json 无关，使用更确切的 root_files，避免启动后没有 config 文件，服务高CPU与内存
    -- root_files = util.insert_package_json(root_files, 'tailwindcss', fname)
    root_files = util.root_markers_with_field(root_files, { 'mix.lock' }, 'tailwind', fname)

    -- Find the config file
    -- local root_files_str = table.concat(root_files, ", ")
    -- vim.notify("root_files: " .. root_files_str, vim.log.levels.INFO, { title = "tailwindcss language server load" })
    
    local found = vim.fs.find(root_files, { path = fname, upward = true })
    
    -- Check if a file was found, If not found, do nothing
    if found and found[1] then
      vim.notify("found: " .. found[1], vim.log.levels.INFO, { title = "tailwindcss language server load" })
      -- If found, call the callback with the parent of the first found file
      on_dir(vim.fs.dirname(found[1]))
    end
    -- on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
  end,
}