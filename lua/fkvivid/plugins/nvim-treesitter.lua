return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"proto",
				"python",
				"query",
				"regex",
				"scss",
				"terraform",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
                "angular",
			},
			auto_install = true,
		})
		-- Enable treesitter-based highlighting and indentation
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
		vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp" },
			callback = function()
				vim.opt_local.cindent = true
				vim.opt_local.indentexpr = ""
			end,
		})
	end,
}
