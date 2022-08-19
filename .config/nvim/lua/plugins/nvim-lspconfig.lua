local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

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

