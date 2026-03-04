local ender_pearl = require("ender_pearl")
local machine_wall = require("machine_wall")

local toolbar_list = {}
table.insert(toolbar_list, ender_pearl.toolbar_items)
table.insert(toolbar_list, machine_wall.toolbar_items)

return {
    toolbar_list = toolbar_list
}
