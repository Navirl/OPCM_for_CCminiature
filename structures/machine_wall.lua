local structure = require('structures.structure')

local machine_wall = structure.new({
    item_name = "Compact Machine Wall",
    sleep_time = 6,
    proj_struct = {
        "minecraft:iron_block", "",
        "", "",

        "minecraft:redstone", "",
        "", "",
    }
})

return machine_wall
