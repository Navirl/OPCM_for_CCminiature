local structure = require('structures.structure')

local machine_wall = structure.new({
    item_name = "machine_wall",
    proj_struct = {
        "iron_block", "",
        "", "",

        "redstone", "",
        "", "",
    }
})

return machine_wall
