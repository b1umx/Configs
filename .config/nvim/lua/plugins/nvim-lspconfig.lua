local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig['sumneko_lua'].setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim', 'use' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false }
        }
    }
})

lspconfig['rust_analyzer'].setup({
})

local on_attach = function(client, bufnr)
    local keyopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, keyopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, keyopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keyopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, keyopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, keyopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, keyopts)
    vim.keymap.set('n', '<leader>lw', ':ClangdSwitchSourceHeader<CR>', keyopts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, keyopts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, keyopts)
end

lspconfig['clangd'].setup({
    cmd = { 'clangd', "--header-insertion=never" },
    capabilities = capabilities,
    on_attach = on_attach
})

-- lspconfig['ccls'].setup({
    -- on_attach = on_attach
-- })

local path = require('plenary.path')
lspconfig['cmake'].setup({
    filetypes = { 'cmake' },
    buildDirectory = tostring(path:new('{cwd}', 'build'))
})

