local structure = require('structures.structure')

local giant_compact_machine = structure.new({
    item_name = "Giant Compact Machine",
    sleep_time = 12,
    proj_struct = {
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",
        "Compact Machine Wall", "Glitched Large Machine", "Compact Machine Wall",
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",

        "Compact Machine Wall", "Glitched Large Machine", "Compact Machine Wall",
        "Glitched Large Machine", "Machine Casing", "Glitched Large Machine",
        "Compact Machine Wall", "Glitched Large Machine", "Compact Machine Wall",

        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",
        "Compact Machine Wall", "Glitched Large Machine", "Compact Machine Wall",
        "Compact Machine Wall", "Compact Machine Wall", "Compact Machine Wall",

    },
})

return giant_compact_machine
