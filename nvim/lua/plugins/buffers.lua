local remap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

remap("n", "g<c-l>", '<cmd>lua require("swap-buffers").swap_buffers("l")<cr>', opts)
remap("n", "g<c-k>", '<cmd>lua require("swap-buffers").swap_buffers("k")<cr>', opts)
remap("n", "g<c-j>", '<cmd>lua require("swap-buffers").swap_buffers("j")<cr>', opts)
remap("n", "g<c-h>", '<cmd>lua require("swap-buffers").swap_buffers("h")<cr>', opts)

require("swap-buffers").setup()
