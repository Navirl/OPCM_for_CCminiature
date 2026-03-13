return {
    pull = function(event_name)
        if event_name == "redstone_changed" then
            return "","","","",15
        end
        if event_name == "modem_message" then
            return "","","","",'make^ender_pearl^[{"size":26,"name":"obsidian"},{"size":1,"name":"redstone_block"},{"size":1,"name":"redstone"}]'
            --- return "","","","","finished"
        end
    end
}
