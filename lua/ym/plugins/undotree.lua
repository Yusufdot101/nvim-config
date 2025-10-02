-- lua/plugins/undotree.lua
return {
	"mbbill/undotree",
	config = function()
		-- Toggle with <leader>u
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
	end,
}
