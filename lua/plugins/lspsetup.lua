local on_attach = require("util.lsputils").on_attach

return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
            },
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "efm",
                    "lua_ls",
                    "rust_analyzer",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("lspsaga").setup({
                -- keybinds for navigation in lspsaga window
                move_in_saga = { prev = "<C-k>", next = "<C-j>" },
                -- use enter to open file with finder
                finder_action_keys = {
                    open = "<CR>",
                },
                -- use enter to open file with definition preview
                definition_action_keys = {
                    edit = "<CR>",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "windwp/nvim-autopairs",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "creativenull/efmls-configs-nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            require("neoconf").setup({})

            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")

            local signs = { Error = " ", Warm = " ", Hint = "", Info = " " }
            for name, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. name
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- configure lsp setup
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

            -- configure python setup
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    pyright = {
                        disableOrganizeImports = false,
                        analysis = {
                            useLibraryCodeForTypes = true,
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            autoImportCompletions = true,
                        },
                    },
                },
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            local luacheck = require("efmls-configs.linters.luacheck")
            local stylua = require("efmls-configs.formatters.stylua")

            local flake8 = require("efmls-configs.linters.flake8")
            local black = require("efmls-configs.formatters.black")

            local languages = {
                lua = { luacheck, stylua },
                python = { flake8, black },
            }

            -- configure efm server
            local efml_config = {
                filetypes = vim.tbl_keys(languages),
                init_options = {
                    documentFormatting = true,
                    documentRangeFormatting = true,
                    hover = true,
                    documentSymbol = true,
                    codeAction = true,
                    completion = true,
                },
                settings = {
                    rootMarkers = { "./git" },
                    languages = languages,
                },
            }

            -- configure efm server
            lspconfig.efm.setup(vim.tbl_extend("force", efml_config, {}))

            -- format on save
            local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = lsp_fmt_group,
                callback = function()
                    local efm = vim.lsp.get_active_clients({ name = "efm" })

                    if vim.tbl_isempty(efm) then
                        return
                    end

                    vim.lsp.buf.format({ name = "efm" })
                end,
            })
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            local rt = require("rust-tools")

            rt.setup({})
        end,
    },
}

