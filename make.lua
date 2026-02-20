local structure = require("data.structure")
local robot = require("robot")

local function getSlotNumFromTable(toolbar_items,item_name)
    for i,v in toolbar_items do
        name, num = string.match(v, "([^:]+):(%d+)")
        if name == item_name then
            local slotnum = i
            return slotnum
        end
    end
end

local make = function(structure_table, proj_light_size)
    if getmetatable(structure_table) ~= getmetatable(structure) then
        error("set structure is unknown data.")
    end

    local toolbar_items = structure_table.toolbarItems()
    local size, edge_size, face_size = structure_table.calcSize()

    local size_diff = proj_light_size - edge_size
    if size_diff < 0 then
        error("set structure is too giant about projector size.")
    end

    robot.right(2)
    for i1, v1 in structure_table.proj_struct do
        if v1 ~= "" then
            robot.select(getSlotNumFromTable(toolbar_items,v1))
            robot.placeDown(v1)
        end

        if i1 % edge_size == 0 then
            robot.left(edge_size - 1)
            if i1 % face_size == 0 then
                robot.north(edge_size - 1)
                robot.up(1)
            else
                robot.south(1)
            end
        else
            robot.right(1)
        end
    end

    if size_diff >= 0 then
        robot.up(size_diff)
    end

    robot.dropdown(structure_table.drop_item)
    robot.left(2)
    robot.down(proj_light_size)
end

return {
    make = make
}
