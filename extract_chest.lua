local tp = require("component.transposer")
local tkeys_to_numbers = require("tkeys_to_numbers")

return function(chest_sides,robot_sides)
    local chest_stacks = tp.getAllStacks(chest_sides)
    local chest_stacks_data = tkeys_to_numbers(chest_stacks.getAll())
    local chest_stacks_size = chest_stacks.count()

    local now_size = 0.0
    for i,v in ipairs(chest_stacks_data) do
        if v["size"] > 0.0 then
            now_size = now_size + v["size"]
            tp.transferItem(chest_sides, robot_sides, v["size"],i,i)
        end
        if now_size >= chest_stacks_size then
            break
        end
    end
end
