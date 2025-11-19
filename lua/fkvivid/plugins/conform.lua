return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },

                -- Prettier for all these:
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
            },

            -- Override all prettier settings globally
            formatters = {
                prettier = {
                    command = "prettier",
                    args = {
                        "--stdin-filepath", "$FILENAME",
                        "--single-quote", "false",
                        "--semi", "true",
                        "--tab-width", "4",
                        "--use-tabs", "false",
                        "--print-width", "150",
                    },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            require("conform").format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end)
    end,
}

