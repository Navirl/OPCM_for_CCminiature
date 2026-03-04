local structure = require("data.structure")

local machine_wall = structure.new({
proj_struct = {
                    "iron_block","",
                    "","",

                    "redstone","",
                    "","",
},
drop_item = "redstone",
detect_item = "iron_block"
})

return machine_wall
