local M = {}

-- 確実に子テーブルのデータのみを書き換えるため、インスタンスを作成
-- .はselfを渡さない
-- Mが作られる->instanceの親にMをセット->instanceを返すという流れ、自動でメタテーブルをセット
function M.new()
    local instance = {
        proj_struct = {},
        drop_item = "",
        detect_item = ""
    }
    setmetatable(instance, { __index = M })
    return instance
end

function M:toolbarItems()
    local temp_toolbar = {}
    for i, v in ipairs(self.proj_struct) do
        -- 一回目は入ってないが、次から増えていく
        for i2, v2 in ipairs(temp_toolbar) do
            if v2 == v then
                temp_toolbar[i2 + 1] = temp_toolbar[i2 + 1] + 1
                break
            end
            if i2 == #temp_toolbar then
                table.insert(temp_toolbar, v)
                table.insert(temp_toolbar, 1)
            end
        end
        if i == 1 then
            table.insert(temp_toolbar, v)
            table.insert(temp_toolbar, 1)
        end
    end
    local broke = false
    for i, v in ipairs(temp_toolbar) do
        if self.drop_item == v then
            temp_toolbar[i + 1] = temp_toolbar[i + 1] + 1
            broke = true
            break
        end
    end
    if not broke then
        table.insert(temp_toolbar, self.drop_item)
        table.insert(temp_toolbar, 1)
    end

    local toolbar_items = {}
    for i = 1, #temp_toolbar, 2 do
        table.insert(toolbar_items,
                        temp_toolbar[i] .. ":" .. temp_toolbar[i+1]
                    )
        if temp_toolbar[i] == self.detect_item then
            table.insert(toolbar_items,1,toolbar_items[#toolbar_items])
            table.remove(toolbar_items)
        end
    end
    return toolbar_items
end

function M:calcSize()
    local size = #self.proj_struct
    local edge_size = 0
    local face_size = 0
    for i = 1, 5, 1 do
        if size == i ^ 3 then
            edge_size = i
            face_size = math.tointeger(i ^ 2)
        end
    end
    -- assertはtrueは素通し、falseで止める
    assert(size % edge_size == 0,size .. " is no cubic number, or too big.")
    return size, edge_size, face_size
end

return M
