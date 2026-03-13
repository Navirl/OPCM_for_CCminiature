local ender_pearl = require('structures.ender_pearl')
local machine_wall = require('structures.machine_wall')

local structure_list = {}
structure_list[ender_pearl.item_name] = ender_pearl
structure_list[machine_wall.item_name] = machine_wall

return {
    structure_list = structure_list,
}
