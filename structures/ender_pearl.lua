local structure = require('structures.structure')

local ender_pearl = structure.new({
    item_name = "Ender Pearl",
    sleep_time = 11,
    proj_struct = {
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",

        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:redstone_block", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",

        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",
        "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian",

    },
})

return ender_pearl
