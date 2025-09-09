return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        --ColorScheme 
        vim.cmd([[colorscheme tokyonight-storm]])

        -- Translucent Background
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
