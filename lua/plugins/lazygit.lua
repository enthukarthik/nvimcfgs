return {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	config = function()
		require("telescope").load_extension("lazygit")

		vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
	end,
}

