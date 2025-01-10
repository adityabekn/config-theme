clink.prompt.register_filter(function()
    local cwd = clink.get_cwd()
    if cwd then
        local folder_name = string.match(cwd, "[^\\]+$")
        if folder_name then
            os.execute("title " .. folder_name)
        end
    end
end, 1)
