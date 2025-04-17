local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "~/.cache/code/java/" .. project_name

-- print("Java LSP: Starting...")
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"java", -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		-- "--add-opens",
		-- "java.base/sun.nio.fs=ALL-UNNAMED",
        "-Dfile.encoding=UTF-8",
		-- "-XX:+UseParallelGC",
		-- "-XX:GCTimeRatio=4",
		-- "-XX:AdaptiveSizePolicyWeight=90",
		-- "-Dsun.zip.disableMemoryMapping=true",
		-- "-Xmx1g",
		-- "-Xms100m",

		"-javaagent:~/.m2/repository/org/projectlombok/lombok/1.18.26/lombok-1.18.26.jar",
		

		-- 💀
		"-jar",
		"~/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		"~/jdtls/config_mac",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},



	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
                
            configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "~/.sdkman/candidates/java/8.0.442-tem",
					},
				},

				maven = {
					userSettings = "~/.m2/settings.xml",
				},
			},
			autobuild = {
				enabled = false,
			},
        },
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
	},
}

-- spring-boot 
require("spring_boot").setup({})
-- 添加 spring-boot jdtls 扩展 jar 包
vim.list_extend(config.init_options.bundles, require("spring_boot").java_extensions())

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
-- print("Java LSP: Initialization complete.")