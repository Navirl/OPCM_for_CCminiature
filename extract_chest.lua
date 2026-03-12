local sides = require("sides")
local tp = require("component.transposer")
local tkeys_to_numbers = require("tkeys_to_numbers")

return function()
    local chest_stacks = tp.getAllStacks(sides.back)
    local chest_stacks_data = tkeys_to_numbers(chest_stacks.getAll())
    local chest_stacks_size = chest_stacks.count()

    local now_size = 0.0
    for i,v in ipairs(chest_stacks_data) do
        if v["size"] > 0.0 then
            now_size = now_size + v["size"]
            tp.transferItem(sides.up, sides.down, v["size"],i,i)
        end
        if now_size >= chest_stacks_size then
            break
        end
    end
end
