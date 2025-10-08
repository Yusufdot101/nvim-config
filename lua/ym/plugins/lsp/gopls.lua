return {
	vim.lsp.config("gopls", {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
				completeUnimported = true,
				usePlaceholders = true,
			},
		},
	}),
	vim.lsp.enable("gopls"),
}
