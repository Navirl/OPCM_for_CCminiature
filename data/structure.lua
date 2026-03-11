local M = {}

-- 確実に子テーブルのデータのみを書き換えるため、インスタンスを作成
-- .はselfを渡さない
-- Mが作られる->instanceの親にMをセット->instanceを返すという流れ、自動でメタテーブルをセット
function M.new(data)
    local instance = {
        proj_struct = data.proj_struct or {}
    }
    setmetatable(instance, { __index = M })
    return instance
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
            break
        end
    end
    -- assertはtrueは素通し、falseで止める
    assert(size % edge_size == 0, size .. " is no cubic number, or too big.")
    return edge_size, face_size
end

return M
