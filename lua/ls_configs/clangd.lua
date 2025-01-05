local data_dir = vim.fn.stdpath("data")
local system_clangd = vim.fn.exepath("clangd") -- Find clangd in system paths

-- local ls_options = "--background-index"

if system_clangd ~= "" then
    -- clangd installed on system so use that
    require("lspconfig").clangd.setup({
        cmd = {"clangd", ls_options}
    })
else
    -- look for clangd in .local/share/nvim
    -- clangd version number kept to make updates explicit
    local local_clangd = data_dir .. "/lsps/clangd_19.1.2/bin/clangd"
    require("lspconfig").clangd.setup({
        cmd = {local_clangd, ls_options}
    })
end
