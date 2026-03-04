local M = {}

-- 確実に子テーブルのデータのみを書き換えるため、インスタンスを作成
-- .はselfを渡さない
-- Mが作られる->instanceの親にMをセット->instanceを返すという流れ、自動でメタテーブルをセット
function M.new(data)
    local instance = {
        proj_struct = data.proj_struct or {},
        drop_item = data.drop_item or "",
        detect_item = data.detect_item or "",
    }
    setmetatable(instance, { __index = M })
    --　値を貰い、metatable設定後ならtoolbarItems()が使える
    instance.toolbar_items = instance:toolbarItems()
    return instance
end

function M:toolbarItems()
    local temp_toolbar = {}
    local toolbar_size = 0
    for i, v in ipairs(self.proj_struct) do
        -- 空ならなにもしない
        if v ~= "" then
            toolbar_size = #temp_toolbar
            for i2, v2 in ipairs(temp_toolbar) do
                -- 最初一つ目は直追加
                if toolbar_size == 0 then
                    table.insert(temp_toolbar, v)
                    table.insert(temp_toolbar, 1)
                    break
                end
                -- 見つけたら追加
                if v2 == v then
                    temp_toolbar[i2 + 1] = temp_toolbar[i2 + 1] + 1
                    break
                end
                -- 見つからない場合は末尾に追加
                -- #temp_toolbarだと、追加後のサイズもforで回してしまうので事前計算
                if i2 == toolbar_size then
                    table.insert(temp_toolbar, v)
                    table.insert(temp_toolbar, 1)
                end
            end

        end
    end
    -- ツールバーにdrop_itemがあればそこに追加、なければ末尾に追加
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
            temp_toolbar[i] .. ":" .. temp_toolbar[i + 1]
        )
        -- detect_itemを先頭に
        if temp_toolbar[i] == self.detect_item then
            table.insert(toolbar_items, 1, toolbar_items[#toolbar_items])
            table.remove(toolbar_items)
        end
    end
    return toolbar_items
end

function M:calcEdgeFace()
    local size = #self.proj_struct
    local edge_size = 1
    local face_size = 1
    for i = 1, 5, 1 do
        if size == i ^ 3 then
            edge_size = i
            -- i^2はfloatであり、math.integer()はnilの可能性がある
            -- or 0でnilのdefaultを0にすることもできる、nilは偽なので
            face_size = i * i
        end
    end
    -- assertはtrueは素通し、falseで止める
    assert(size % edge_size == 0, size .. " is no cubic number, or too big.")
    return edge_size, face_size
end

return M
