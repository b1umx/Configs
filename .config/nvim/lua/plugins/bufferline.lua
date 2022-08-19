local bufferline = require('bufferline')

bufferline.setup({
    options = {
        offsets = {{
            filetype = 'NvimTree',
            highlight = 'Directory',
            padding = 1
        }}
    }
})

