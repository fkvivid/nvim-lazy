return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Go
				go = { "goimports", "gofmt" },

				-- C++
				cpp = { "clang_format" },
				c = { "clang_format" },

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
				angular = { "prettierd" },

				-- Python
				python = { "isort", "black" },

				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,

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
