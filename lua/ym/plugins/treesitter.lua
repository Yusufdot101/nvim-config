return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- list of parsers you want installed
      ensure_installed = {
        "lua",
        "go",
        "javascript",
        "typescript",
        "python",
        "c",
        "cpp",
        "html",
        "css",
        "json",
        "bash",
        "vim",
        "markdown",
      },

      sync_install = false,
      auto_install = true, -- auto install missing parsers when entering buffer

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
    })
  end,
}

