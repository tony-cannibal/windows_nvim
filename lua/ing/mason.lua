local mason_ok, mason_settings = pcall(require, "mason.settings")
if not mason_ok then
    return
end


mason_settings.set({
  ui = {
    border = 'rounded',
    -- icons = {
    --         package_installed = "✓",
    --         package_pending = "➜",
    --         package_uninstalled = "✗"
    --     }
  }
})
