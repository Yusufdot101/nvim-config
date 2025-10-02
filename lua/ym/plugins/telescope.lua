return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    -- Common keymaps
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
    -- vim.keymap.set("n", "<leader>ps", function()
    --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end, { desc = "Grep input" })
    vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
  end,
}
