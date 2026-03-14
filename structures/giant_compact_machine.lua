local structure = require('structures.structure')

local giant_compact_machine = structure.new({
    item_name = "Giant Compact Machine",
    sleep_time = 12,
    proj_struct = {
        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "glitched3", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

        "wallbreakable", "glitched3", "wallbreakable",
        "glitched3", "blockcasing", "glitched3",
        "wallbreakable", "glitched3", "wallbreakable",

        "wallbreakable", "wallbreakable", "wallbreakable",
        "wallbreakable", "glitched3", "wallbreakable",
        "wallbreakable", "wallbreakable", "wallbreakable",

    },
})

return giant_compact_machine
