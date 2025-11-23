return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function get_theme_colors()

            local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Keyword" })
            local color_keyword = ok and hl.fg and string.format("#%06x", hl.fg) or "#aa00ff"

            ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "String" })
            local color_string = ok and hl.fg and string.format("#%06x", hl.fg) or "#00ffaa"

            ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Function" })
            local color_function = ok and hl.fg and string.format("#%06x", hl.fg) or "#00aaff"

            ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Error" })
            local color_error = ok and hl.fg and string.format("#%06x", hl.fg) or "#ff4444"

            return {
                color4 = color_function,  -- Blu
                color5 = color_keyword,   -- Viola
                color6 = color_string,    -- Verde
                color9 = color_error,     -- Rosso
            }
        end

        local function setup_alpha()
            local colors = get_theme_colors()

            local color4 = colors.color4
            local color5 = colors.color5
            local color6 = colors.color6
            local color9 = colors.color9

            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = color9, bold = true })
            vim.api.nvim_set_hl(0, "AlphaClock", { fg = color6, bold = true })
            vim.api.nvim_set_hl(0, "AlphaButton", { fg = color4 })
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = color5, bold = true })

            local clock = {
                type = "text",
                val = os.date(" %H:%M:%S"),
                opts = { position = "center", hl = "AlphaClock" },
            }

            vim.loop.new_timer():start(0, 1000, vim.schedule_wrap(function()
                clock.val = os.date(" %H:%M:%S")
                pcall(alpha.redraw)
            end))

            local logo = {
                "⠀⠀⠀⠀⠀⠀⢀⡴⢾⣶⣴⠚⣫⠏⠉⠉⠛⠛⢭⡓⢶⣶⠶⣦⡀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⣰⠋⡀⣠⠟⢁⣾⠇⠀⣀⣷⠀⠀⠓⣝⠂⠙⣆⢄⢻⡞⢢⠀⠀⠀",
                "⠀⠀⠀⠀⢠⡇⢸⢡⠃⢠⡞⠁⠀⣰⡟⠉⢦⣄⠀⠈⢆⠀⢻⣾⡄⢧⢸⠀⠀⠀",
                "⠀⠀⠀⠀⢸⠀⡇⡌⠀⡞⠀⢀⣴⡋⠀⠀⠀⣙⣷⡀⠘⡄⠘⣿⣧⢸⣼⣥⠀⠀",
                "⣀⣀⣀⣀⣞⣰⠁⡇⠀⣧⢴⡛⠛⠁⠀⠀⠀⠉⠉⡙⡇⡇⠀⣿⣸⣼⣿⣇⣀⣀",
                "⠳⢽⣷⠺⡟⡿⣯⡇⠰⣧⢩⣭⣥⠀⠀⠀⠀⢠⣭⣥⠁⡀⠀⣿⡟⣴⠶⢁⡨⠊",
                "⠀⠀⠉⢳⢦⣅⠘⣿⣄⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⢀⣏⣳⡇⢴⡞⠁⠀",
                "⠀⠀⠀⣼⢸⡅⢹⣿⣿⣾⣟⠀⠀⠠⣀⢄⡠⠀⠀⠠⡚⣿⡿⣿⢻⠁⢹⣷⡀⠀",
                "⠀⠀⠸⡏⠸⡇⢼⣿⡿⠟⠛⠓⣦⣄⣀⣀⣀⣀⡤⠴⠿⢿⡟⠛⠺⣦⣬⣗⠀⠀",
                "⠀⠀⢰⡇⠀⡇⠸⡏⠀⠀⢰⠋⠙⠛⠛⠉⠉⢹⠀⠀⠀⠀⡇⠀⠀⣿⣿⣿⣟⡃",
                "⠀⡐⣾⠀⡀⢹⠀⣿⣄⠀⢸⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⢠⣇⠀⠀⣿⣿⣿⣛⡃",
                "⠀⣾⣿⠀⡇⠘⡄⢸⣿⠆⠈⡇⠀⠀⠀⠀⠈⢉⠃⠀⣰⡾⠻⠃⢰⣿⣿⣛⡋⠀",
                "⠀⣿⣿⡆⢷⠀⢧⠈⣿⠤⠤⣇⠀⠀⠀⠀⢀⣸⣠⢾⠟⠓⡶⢤⣾⣿⣿⣟⣓⠀",
            }

            dashboard.section.clock = clock
            dashboard.section.header.val = logo
            dashboard.section.header.opts.hl = "AlphaHeader"

            dashboard.section.buttons.val = {
                dashboard.button( "f", "󰱼  > Find file", ":lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files' } })<CR>"),
                dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
                dashboard.button( "o", "󱞁  > Obsidian" , ":e ~/Appunti/Home.md<CR>"),
                dashboard.button( "O", "󱞁  > Obsidian search" , ":cd ~/Appunti | Telescope find_files<CR>"),
                dashboard.button( "c", "  > Config" , ":cd ~/.config/nvim | Telescope find_files<CR>"),
                dashboard.button( "h", "  > Settings" , ":cd ~/.config/hypr | Telescope find_files<CR>"),
                dashboard.button( "q", "󰈆  > Quit", ":qa<CR>"),
            }

            dashboard.config.layout = {
                { type = "padding", val = 5 },
                dashboard.section.header,
                { type = "padding", val = 3 },
                dashboard.section.clock,
                { type = "padding", val = 3 },
                dashboard.section.buttons,
            }

            alpha.setup(dashboard.config)
        end

        setup_alpha()

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("AlphaColorScheme", { clear = true }),
            callback = function()
                setup_alpha()
            end,
        })
    end,
}

