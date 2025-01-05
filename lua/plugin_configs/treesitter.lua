require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,  -- Enables syntax highlighting
    },
    ensure_installed = { "c", "lua", "vim", "query", "python", "scala" },
    auto_install = false,
    additional_vim_regex_highlighting = false,

})
