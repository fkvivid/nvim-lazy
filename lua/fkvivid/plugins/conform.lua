return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Go
				go = { "goimports", "gofmt" },

				-- Lua
				lua = { "stylua" },

				-- Web technologies
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },

				-- Python
				python = { "isort", "black" },

				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },

			},

			-- Override all prettier settings globally
			formatters = {
				prettier = {
					command = "prettier",
					args = {
						"--stdin-filepath",
						"$FILENAME",
						"--single-quote",
						"false",
						"--semi",
						"true",
						"--tab-width",
						"4",
						"--use-tabs",
						"false",
						"--print-width",
						"150",
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
