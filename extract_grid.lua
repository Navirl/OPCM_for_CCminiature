local c = require("component")
local grid = c.block_refinedstorage_grid_0

-- structureの作成アイテムはtasksに存在するか
-- 実際にrobotが作成できるアイテムかは保証しない
-- item_nameはstructureに追加する
--@return number|string
function getMakingIteminTaskNum(item_name,tasks)
    for i,v in pairs(tasks) do
        repeat
            -- 最後のnまで回してしまうのでbreak
            if type(v) ~= type(table) then
                break
            end
            --- local _, name = string.match(
            ---     -- outputsはあくまでパターンの出力
            ---     -- 何を作るかはstacksの方のはず
            ---     v["stack"]["item"]["name"],
            ---     "([^:]+):(.+)"
            --- )
            --- if name == item_name then
            if v["stack"]["item"]["label"] == item_name then
                return i
            end
            -- 無限ループしないよう一応最後まで来たらbreak
            if i == #tasks then
                break
            end
        until true
    end
    return "No making that item in tasks."
end

-- タスクナンバーでタスクを指定して渡す
-- グリッドからinputのアイテムを取り出せるか
-- 取り出したもので作成できるかは保証しない
-- 複数セットを同時に計算できない、一回crafter挟むんだし作れないならそこで弾かれるはず
--@return table|string
function calcToolbaraboutExtractableTaskItems(task)
    local error_message = ""
    local toolbar_items = {}
    for _i,v in ipairs(task["pattern"]["inputs"]) do
        -- continue代わり
        while true do
            -- inputに何も入ってないならcontinue
            if v["n"] == 0 then
                break
            else
                -- gridの方が数あればOK
                --- local _, itemname = string.match(
                ---     v[1]["name"],
                ---     "([^:]+):(.+)"
                --- )
                local itemname = v[1]["label"]
                local itemsize = v[1]["size"]
                if itemsize <= grid.getItem({name=itemname}).size then
                    table.insert(toolbar_items, {name=itemname, size=math.tointeger(itemsize)})
                    break
                else
                    error_message = error_message .. "Not enough " .. v[1]["label"] .. "\n"
                end
            end
            break
        end
    end

    if error_message == "" then
        return toolbar_items
    else
        return error_message
    end
end

function extractItemFromGrid(item_data,chest_side)
    grid.extractItem({name=item_data.name},item_data.size,chest_side)
end

return {
    getMakingIteminTaskNum = getMakingIteminTaskNum,
    calcToolbaraboutExtractableTaskItems = calcToolbaraboutExtractableTaskItems,
    extractItemFromGrid = extractItemFromGrid,
}
