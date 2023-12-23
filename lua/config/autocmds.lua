-- only highlight when searching
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--    callback = function()
--       local cmd = vim.v.event.cmdtype
--       if cmd == "/" or cmd == "?" then
--          vim.opt.hlsearch = true
--       end
--    end,
-- })

-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--    callback = function()
--       local cmd = vim.v.event.cmdtype
--       if cmd == "/" or cmd == "?" then
--          vim.opt.hlsearch = false
--       end
--    end,
-- })

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank({ timeout = 500 })
   end,
})

-- Open Neotree while entering Vim
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         if vim.fn.argc() == 0 then
--             vim.cmd "Neotree toggle"
--         end
--     end,
-- })
