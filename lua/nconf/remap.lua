vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = 'Close buffer' })

vim.keymap.set("n", "<F13>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<F14>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<F15>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<F16>", "<C-w>k", { noremap = true, silent = true })

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')

vim.keymap.set("n", "<leader>tw", function()
  require("neotest").run.run({ jestCommand = "jest --watch" })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("belowright split | resize 10 | terminal")
  vim.cmd("startinsert")
end, { noremap = true, silent = true })

local neotree_open = false
local function toggle_neotree()
  neotree_open = not neotree_open
  if neotree_open then
    vim.cmd("Neotree toggle")
  else
    vim.cmd("Neotree close")
  end
end
vim.keymap.set("n", "<leader>E", toggle_neotree, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", toggle_neotree, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
