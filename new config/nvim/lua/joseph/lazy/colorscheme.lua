return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true, -- enable terminal colors
      transparent_mode = true, -- this enables transparent background
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")

      -- Optional: manually force transparency for certain highlight groups
      vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
    end,
  },
}
