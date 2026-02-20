local M = {}

M.proj_struct = {}

M.drop_item = ""

M.detect_item = ""

function M:toolbarItems()
    local temp_toolbar = {}
    local temp_proj_struct = self.proj_struct
    table.insert(temp_proj_struct,self.drop_item)
    for i,v in temp_proj_struct do
        for i2,v2 in temp_toolbar do
            if v2 == v then
                temp_toolbar[i2+1] = temp_toolbar[i2+1] + 1
            end
        end
        table.insert(temp_toolbar,v)
        table.insert(temp_toolbar,1)
    end

    local toolbar_items = {}
    for i = 1, #temp_toolbar, 2 do
        table.insert(toolbar_items,
                        temp_toolbar[i] .. ":" .. temp_toolbar[i+1]
                    )
        if temp_toolbar[i] == self.detect_item then
            table.insert(toolbar_items,0,toolbar_items[#toolbar_items])
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
            face_size = i ^ 2
        end
    end
    assert(size % edge_size ~= 0,size .. " is no cubic number.")
    return size, edge_size, face_size
end

return M
