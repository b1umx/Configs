local lualine = require('lualine')

lualine.setup({
    options = {
        theme = 'sonokai',
        globalstatus = true
    },
    sections = {
        lualine_y = { 'filesize' }
    }
})

