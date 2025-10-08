return {
	vim.lsp.config("cssls", {
		settings = {
			css = { validate = true },
			scss = { validate = true },
			less = { validate = true },
		},
	}),
	vim.lsp.enable("cssls"),
}
