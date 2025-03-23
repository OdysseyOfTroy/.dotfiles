return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()

local lualine = require('lualine')

local colors = {
  bg       = '#15141b',
  fg       = '#a277ff',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  gray     = '#6d6d6d',
  darkpurp = '#29263c',
}

local aura_theme = {
    normal = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.darkpurp },
        c = { fg = colors.fg, bg = colors.bg },
    },
    inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    winbar = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.gray },
        c = { fg = colors.fg, bg = colors.bg },
    },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = aura_theme
  },
  sections = {
    lualine_a = {
        {
            'mode',
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red,
            }
            return { fg = mode_color[vim.fn.mode()] }
            end,
        }
    },
    lualine_b = {
        {
            'branch',
            icon = '',
            color = { fg = colors.fg, gui = 'bold' },
        },
        {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }
    },
    lualine_c = {
        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        }
    },
    lualine_x = {
        {  -- Lsp server name .
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          color = { fg = '#ffffff', gui = 'bold' },
        },
        {
          'o:encoding', -- option component same as &encoding in viml
          fmt = string.upper, -- I'm not sure why it's upper case either ;)
          cond = conditions.hide_in_width,
          color = { fg = colors.green, gui = 'bold' },
        },
        'location',
        { 'progress', color = { fg = colors.fg, gui = 'bold' } },
        {
          'fileformat',
          fmt = string.upper,
          color = { fg = colors.green, gui = 'bold' },
        },
        {
          'diff',
          -- Is it me or the symbol for modified us really weird
          symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
          },
          cond = conditions.hide_in_width,
        },
        {
          function()
            return '▊'
          end,
          color = { fg = colors.blue },
          padding = { left = 1 },
        }
    },
    lualine_y = {},
    lualine_z = {},
  },
}

lualine.setup(config)
end
}
