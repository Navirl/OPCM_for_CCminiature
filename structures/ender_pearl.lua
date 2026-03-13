local structure = require('structures.structure')

local ender_pearl = structure.new({
    item_name = "ender_pearl",
    sleep_time = 8,
    proj_struct = {
        "obsidian", "obsidian", "obsidian",
        "obsidian", "obsidian", "obsidian",
        "obsidian", "obsidian", "obsidian",

        "obsidian", "obsidian", "obsidian",
        "obsidian", "redstone_block", "obsidian",
        "obsidian", "obsidian", "obsidian",

        "obsidian", "obsidian", "obsidian",
        "obsidian", "obsidian", "obsidian",
        "obsidian", "obsidian", "obsidian",

    },
})

return ender_pearl
