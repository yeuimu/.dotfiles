vim.opt.shadafile = "NONE"
vim.api.nvim_create_autocmd("CmdlineEnter", {
  once = true,
  callback = function()
    local shada = vim.fn.stdpath "state" .. "/shada/main.shada"
    vim.o.shadafile = shada
    vim.api.nvim_command("rshada! " .. shada)
  end,
})

-- 当在 normal 模式下检测到文件更改时自动刷新
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- 如果在编辑模式时文件被外部更改，显示提示消息
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN)
  end,
})
