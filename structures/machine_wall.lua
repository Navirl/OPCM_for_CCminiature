local structure = require('structures.structure')

local machine_wall = structure.new({
    item_name = "machine_wall",
    sleep_time = 6,
    proj_struct = {
        "iron_block", "",
        "", "",

        "redstone", "",
        "", "",
    }
})

return machine_wall
