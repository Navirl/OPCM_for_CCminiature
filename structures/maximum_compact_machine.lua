local structure = require('structures.structure')

local maximum_compact_machine = structure.new({
    item_name = "Maximum Compact Machine",
    sleep_time = 12,
    proj_struct = {
        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "glitched4", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

        "wallbreakable", "glitched4", "wallbreakable",
        "glitched4", "blockcasing", "glitched4",
        "wallbreakable", "glitched4", "wallbreakable",

        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "glitched4", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

    },
})

return maximum_compact_machine
