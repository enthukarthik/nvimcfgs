return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
-- Usage :
-- ys{motion}{char} - add
-- ds{char} - delete
-- cs{target}{replacement} - change
--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     delete(functi*on calls)     dsf             function calls
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     Detailed information on how to use this plugin can be found in :h nvim-surround.usage
