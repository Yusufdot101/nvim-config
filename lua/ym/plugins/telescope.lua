return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local telescopeConfig = require("telescope.config")

		-- clone default vimgrep args
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
		-- add flags
		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "-L") -- follow symlinks
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				hidden = true,
				no_ignore = true,
				path_display = { "smart" },
				file_ignore_patterns = { "node_modules", ".git/" },

				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
						"-L",
					},
				},
				live_grep = {
					-- optional: ensure extra args include -L
					additional_args = function()
						return { "-L" }
					end,
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
	end,
}
