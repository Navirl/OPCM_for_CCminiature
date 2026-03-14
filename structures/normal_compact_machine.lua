local structure = require('structures.structure')

local normal_compact_machine = structure.new({
    item_name = "Normal Compact Machine",
    sleep_time = 12,
    proj_struct = {
        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "Block of Gold", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

    },
})

return normal_compact_machine
