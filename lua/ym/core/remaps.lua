local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap = vim.keymap

keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

keymap.set("n", "<C-Left>", "<C-w><") -- shrink vertically
keymap.set("n", "<C-Right>", "<C-w>>") -- grow vertically
keymap.set("n", "<C-Up>", "<C-w>+") -- grow horizontally
keymap.set("n", "<C-Down>", "<C-w>-") -- shrink horizontally

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("x", "<leader>p", [["_dP]])

-- Copies or Yank to system clipboard
keymap.set("n", "<leader>y", [["+y]], opts)

-- leader d delete wont remember as yanked/clipboard when delete pasting
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- ctrl c as escape cuz Im lazy to reach up to the esc key
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
-- format without prettier using the built in
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Unmaps Q in normal mode
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-z>", "<nop>")
keymap.set("n", "<C-o>", "<nop>")

--Stars new tmux session from in here
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- prevent x delete from registering when next paste
keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Executes shell command from in here making file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- tab stuff
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") --open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --go to next
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --go to pre
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- GO keymaps
keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
keymap.set("n", "<leader>en", "oif err != nil {<CR>}<Esc>Oreturn<Esc>")

keymap.set("n", "<leader>h", "i(w http.ResponseWriter, r *http.Request) {<CR>\t<CR>}<CR><Esc>")

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
keymap.set("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
end, { desc = "Toggle LSP diagnostics" })
