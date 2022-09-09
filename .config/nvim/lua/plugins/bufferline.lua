local bufferline = require('bufferline')

bufferline.setup({
    options = {
        close_command = "Bdelete %d",
        right_mouse_command = "vertical sbuffer %d",
        offsets = {{
            text_align = "left",
            filetype = 'NvimTree',
            separator = true
        }},
        separator_style = 'slant'
    }
})

