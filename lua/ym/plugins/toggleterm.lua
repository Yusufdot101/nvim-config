return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = false,
			start_in_insert = true,
			direction = "horizontal",
			float_opts = { border = "curved" },
			hide_numbers = false,
			size = 20,
		},
		config = function(_, opts)
			local toggleterm = require("toggleterm")
			local Terminal = require("toggleterm.terminal").Terminal
			toggleterm.setup(opts)

			local terminals = {}

			for i = 1, 9 do
				terminals[i] = Terminal:new({ id = i })
			end

			-- Use count + <C-t> to toggle terminal 1-9
			-- Just <C-t> = smart toggle
			vim.keymap.set("n", "<leader>t", function()
				local count = vim.v.count
				if count > 0 and count <= 9 then
					terminals[count]:toggle()
				else
					-- smart toggle: close any open terminal, or open terminal 1
					local found_open = false
					for i = 1, 9 do
						local term = terminals[i]
						if term.bufnr and vim.api.nvim_buf_is_valid(term.bufnr) then
							local wins = vim.fn.win_findbuf(term.bufnr)
							if #wins > 0 then
								term:toggle()
								found_open = true
							end
						end
					end
					if not found_open then
						terminals[1]:toggle()
					end
				end
			end, { desc = "Smart or numbered terminal toggle" })

			-- Terminal mode mappings
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })
			vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })
			vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, desc = "Move left" })
			vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, desc = "Move down" })
			vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, desc = "Move up" })
			vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, desc = "Move right" })
		end,
	},
}
