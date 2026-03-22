local structure = require('structures.structure')

local zombie_spawn_egg = structure.new({
    item_name = "Spawn Zombie",
    sleep_time = 11,
    proj_struct = {
        "minecraft:netherrack", "minecraft:netherrack", "minecraft:netherrack",
        "minecraft:netherrack", "minecraft:netherrack", "minecraft:netherrack",
        "minecraft:netherrack", "minecraft:netherrack", "minecraft:netherrack",

        "minecraft:fire_charge", "minecraft:fire_charge", "minecraft:fire_charge",
        "minecraft:fire_charge", "minecraft:soul_sand", "minecraft:fire_charge",
        "minecraft:fire_charge", "minecraft:fire_charge", "minecraft:fire_charge",

        "", "", "",
        "", "minecraft:soul_sand", "",
        "", "", "",

    },
})

return zombie_spawn_egg
