local structure = require("data.structure")
local robot = require("robot")

local function getSlotNumFromTable(toolbar_items, item_name)
    if item_name == "" then
        return nil
    end
    for i, v in ipairs(toolbar_items) do
        local name, num = string.match(v, "([^:]+):(%d+)")
        if name == item_name then
            local slotnum = i
            return slotnum
        end
    end
end

local make = function(structure_table, proj_light_size)
    local meta_structure_table = getmetatable(structure_table).__index
    if meta_structure_table ~= structure then
        error("set structure is unknown data." .. structure .. meta_structure_table)
    end

    local toolbar_items = structure_table:toolbarItems()
    local size, edge_size, face_size = structure_table:calcSize()

    local size_diff = proj_light_size - edge_size
    if size_diff < 0 then
        error("set structure is too giant about projector size.")
    end

    --[[
    rをロボット、xを光とし、最下段のこの位置に置く
    一例として3x3x3の光

        r--xxx
           xxx
           xxx

    ]]
    robot.forward()
    robot.forward()
    for i1, v1 in pairs(structure_table.proj_struct) do
        -- 無ければ何もしない
        if v1 ~= "" then
            local slot_num = getSlotNumFromTable(toolbar_items, v1)
            robot.select(slot_num)
            robot.placeDown()
        end
        -- 端までは設置後前進
        if i1 % edge_size ~= 0 then
            robot.forward()
        else
            for _i = 1, edge_size - 1, 1 do
                robot.back()
            end
            -- 面までは次の行へ移動
            if i1 % face_size ~= 0 then
                robot.turnRight()
                robot.forward()
                robot.turnLeft()
            else
                robot.turnLeft()
                for _i = 1, edge_size - 1, 1 do
                    robot.forward()
                end
                robot.up()
                robot.turnRight()
            end
        end
    end

    if size_diff >= 0 then
        for _i = 1, size_diff, 1 do
            robot.up()
        end
    end
    local slot_num = getSlotNumFromTable(toolbar_items, structure_table.drop_item)
    robot.select(slot_num)
    robot.dropDown(1)
    robot.back()
    robot.back()
    for _i = 1, proj_light_size, 1 do
        robot.down()
    end
end

return {
    make = make
}
