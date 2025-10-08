return {
	vim.lsp.config("emmet_ls", {
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
	}),
	vim.lsp.enable("emmet_ls"),
}
