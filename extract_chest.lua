local c = require("component")
local tp = c.transposer

return function(chest_sides,robot_sides,robot_slot)
    local stack_size = tp.getSlotStackSize(chest_sides,1)
    tp.transferItem(chest_sides, robot_sides, stack_size,1,robot_slot)
end
