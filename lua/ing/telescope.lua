local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
