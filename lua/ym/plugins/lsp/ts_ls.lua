return {
    vim.lsp.config("ts_ls", {
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        single_file_support = true,
        init_options = {
            preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
            },
        },
    }),
    vim.lsp.enable("ts_ls")
}
