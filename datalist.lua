local ender_pearl = require("data.ender_pearl")
local machine_wall = require("data.machine_wall")

local item_names = {}
table.insert(item_names, ender_pearl.item_name)
table.insert(item_names, machine_wall.item_name)

return {
    item_names = item_names
}
