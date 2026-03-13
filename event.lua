return {
    pull = function(event_name)
        if event_name == "redstone_changed" then
            return "","","","",15
        end
        if event_name == "modem_message" then
            return "","","","","finished"
        end
    end
}
