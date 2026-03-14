local structure = require('structures.structure')

local maximum_compact_machine = structure.new({
    item_name = "Maximum Compact Machine",
    sleep_time = 12,
    proj_struct = {
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",
        "Compact Machine Wall", "Glitched Giant Machine", "Compact Machine Wall",
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",

        "Compact Machine Wall", "Glitched Giant Machine", "Compact Machine Wall",
        "Glitched Giant Machine", "Machine Casing", "Glitched Giant Machine",
        "Compact Machine Wall", "Glitched Giant Machine", "Compact Machine Wall",

        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",
        "Compact Machine Wall", "Glitched Giant Machine", "Compact Machine Wall",
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",

    },
})

return maximum_compact_machine
