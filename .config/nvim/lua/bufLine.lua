local bufferline = require("bufferline")
bufferline.setup{
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        numbers = "none",
        indicator = {
            -- style = 'underline',
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            -- icon = '', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        -- diagnostics = "nvim_lsp",
        diagnostics = "none",
        diagnostics_update_in_insert = false,

        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        color_icons = true, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,

        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- separator_style = "slant",
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
    highlights = {
        buffer_selected = {
            -- fg = '#5E81AB',
            fg = '#C97F71',
            bold = true,
            italic = false,
        },
    },
}
