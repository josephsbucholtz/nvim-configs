-- ~/.config/nvim/lua/plugins/lsp.lua

return {
    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        version = "v0.1.7",
    },

    -- Mason (LSP server installer)
    {
        "williamboman/mason.nvim",
        version = "v1.8.3",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason + LSPConfig integration
    {
        "williamboman/mason-lspconfig.nvim",
        version = "v1.24.0",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls", "clangd", "jdtls" },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")

            -- C / C++
            lspconfig.clangd.setup({})

            -- Python
            lspconfig.pyright.setup({})

            -- Lua (for Neovim development)
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Java 
            lspconfig.jdtls.setup({
                cmd = { "jdtls" }, -- Make sure jdtls is in your PATH
                root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
                -- Optional settings:
                settings = {
                    java = {
                        signatureHelp = { enabled = true },
                        contentProvider = { preferred = "fernflower" },
                        completion = {
                            favoriteStaticMembers = {
                                "org.hamcrest.MatcherAssert.assertThat",
                                "org.hamcrest.Matchers.*",
                                "org.hamcrest.CoreMatchers.*",
                                "java.util.Objects.requireNonNull",
                                "java.util.Objects.requireNonNullElse",
                                "org.mockito.Mockito.*",
                            },
                        },
                        sources = {
                            organizeImports = {
                                starThreshold = 9999,
                                staticStarThreshold = 9999,
                            },
                        },
                        codeGeneration = {
                            toString = {
                                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                            },
                        },
                    },
                },
            })
        end,
    },
}

