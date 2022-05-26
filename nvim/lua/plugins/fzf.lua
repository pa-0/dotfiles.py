local M = {}

local function fzf_mappings()
    local nest = require("nest")

    nest.applyKeymaps({
        {
            mode = "n",
            { "\"", "<cmd>lua require('fzf-lua').registers()<cr>" },
            {
                "<c-g>",
                {
                    { "<c-e>", "<cmd>lua require('fzf-lua').files()<cr>" },
                    { "<c-s>", "<cmd>lua require('fzf-lua').live_grep()<cr>" },
                    { "<c-b>", "<cmd>lua require('fzf-lua').buffers()<cr>" },
                    { "<c-l>", "<cmd>lua require('fzf-lua').blines()<cr>" },
                },
            },
        },
        {
            mode = "i",
            {
                { "<c-r>", "<cmd>lua require('fzf-lua').registers()<cr>" },
            },
        },
    })
end

function M.setup()
    fzf_mappings()

    require("fzf-lua").setup({
        winopts = {
            width = 0.87,
        },
    })
end

return M
