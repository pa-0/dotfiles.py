vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
vim.g.fzf_layout = {
    window = {
        width = 0.8,
        height = 0.8
    }
}

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "gfg", ":GitFiles --cache --others --exclude-standard<CR>", opts)
vim.api.nvim_set_keymap("n", "gff", ":Rg<CR>", opts)

vim.cmd [[
augroup fzfconfig
    autocmd! FileType fzf
    autocmd FileType fzf set noshowmode noruler nonu
augroup END
]]
