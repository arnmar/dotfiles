local build_commands = {
    cpp = "!cmake --build build"
}

vim.api.nvim_create_user_command("Build", function()
    local filetype = vim.bo.filetype
    for file, command in pairs(build_commands) do
        if filetype == file then
            vim.cmd(command)
            break
        end
    end
end, {})
