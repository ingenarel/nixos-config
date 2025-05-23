-- map right alt to <ESC>. on windows, i use powertoys.
-- NOTE: need to use these mappings more often.
local function alt_keymap(keymap, action)
    vim.keymap.set({ "n", "v", "o", "i", "c", "t" }, keymap, action, { silent = true, noremap = true })
end

-- <M-h> is mapped to coq_settings.keymap.jump_to_mark
alt_keymap("<M-]>", "<C-]>")
alt_keymap("<M-d>", "<C-d>")
alt_keymap("<M-i>", "<C-i>")
alt_keymap("<M-l>", "<C-l><CMD>ColorizerReloadAllBuffers<CR>")
alt_keymap("<M-n>", "<C-n>")
alt_keymap("<M-o>", "<C-o>")
alt_keymap("<M-p>", "<C-p>")
alt_keymap("<M-q>", "<C-q>")
alt_keymap("<M-r>", "<C-r>")
alt_keymap("<M-u>", "<C-u>")
vim.keymap.set("i", "<M-w>", "<C-w>", { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-/>", function()
    vim.cmd("HopAnywhereAC")
end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-?>", function()
    vim.cmd("HopAnywhereBC")
end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-f>", function()
    vim.cmd("HopChar1AC")
end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-F>", function()
    vim.cmd("HopChar1BC")
end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-j>", function()
    vim.cmd("HopLineAC")
end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<M-k>", function()
    vim.cmd("HopLineBC")
end, { silent = true, noremap = true })
