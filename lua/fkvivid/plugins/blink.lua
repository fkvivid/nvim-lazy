return {
	"saghen/blink.cmp",
	version = "*",
	config = function()
		require("blink.cmp").setup({
			snippets = { preset = "default" },
			signature = { enabled = true },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
				providers = {
					cmdline = {
						min_keyword_length = 2,
					},
				},
			},
            keymap = { preset = 'default' },
			-- keymap = {
			-- 	["<C-f>"] = {},
			-- },
			-- cmdline = {
			-- 	enabled = false,
			-- 	completion = { menu = { auto_show = true } },
			-- 	keymap = {
			-- 		["<CR>"] = { "accept_and_enter", "fallback" },
			-- 	},
			-- },
			completion = {
				-- menu = {
				-- 	border = "rounded",
				-- 	scrolloff = 1,
				-- 	scrollbar = false,
				-- 	draw = {
				-- 		padding = 1,
				-- 		gap = 1,
				-- 		columns = {
				-- 			{ "kind_icon" },
				-- 			{ "label", "label_description", gap = 1 },
				-- 			{ "kind" },
				-- 			{ "source_name" },
				-- 		},
				-- 	},
				-- },
				documentation = {
					window = {
						border = "rounded",
						scrollbar = false,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
		})
	end,
}
