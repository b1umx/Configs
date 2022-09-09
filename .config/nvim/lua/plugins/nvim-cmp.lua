local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        documentation = {
            max_width = 320,
            max_height = 480
        }
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim-lsp-signature-help' },
        { name = 'luasnip' },
        { name = 'path' }
    }, {
        {
            name = 'buffer',
            max_item_count = 5
        }
    }),
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
        ['<C-l>'] = cmp.mapping.confirm(),
        ['<C-h>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable() then
               luasnip.jump(-1)
            else
               fallback()
            end
        end, { 'i', 's' })
    }
})

