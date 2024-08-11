return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    --flavour = "auto", --latte, frappe, macciato, mocha, auto
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end
}
