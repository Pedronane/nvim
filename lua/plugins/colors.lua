return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          -- Light themes
          {
            name = "Rose Pine Dawn",
            colorscheme = "rose-pine-dawn",
          },
          {
            name = "One Dark (Light)",
            colorscheme = "onedark",
          },
          -- Dark themes
          {
            name = "Tokyo Night",
            colorscheme = "tokyonight-night",
          },
          {
            name = "Catppuccin Mocha",
            colorscheme = "catppuccin-mocha",
          },
          {
            name = "Gruvbox Dark",
            colorscheme = "gruvbox",
          },
          {
            name = "Nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "Rose Pine Moon",
            colorscheme = "rose-pine-moon",
          },
          {
            name = "One Dark Pro",
            colorscheme = "onedark_vivid",
          },
          {
            name = "Nord",
            colorscheme = "nord",
          },
          {
            name = "Cyberdream",
            colorscheme = "cyberdream",
          },
        },
        livePreview = true,
        persistence = {
          enabled = true,
        },
      })
    end,
  },
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "morhetz/gruvbox", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "rose-pine/neovim", lazy = true, name = "rose-pine" },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "arcticicestudio/nord-vim", lazy = true, name = "nord" },
  { "scottmckendry/cyberdream.nvim", lazy = true },
}

