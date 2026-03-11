local json = require("cjson")

-- キーを数値に変換する関数
-- jsonのキーは文字列型しかないので、これで実際のキー型と合わせてテスト可能にする
local function keys_to_numbers(t)
    if type(t) ~= "table" then return t end

    local new_t = {}
    for k, v in pairs(t) do
        -- キーが文字列で、かつ数値に変換可能な場合
        local num_key = tonumber(k)
        if type(k) == "string" and num_key then
            new_t[num_key] = keys_to_numbers(v)
        else
            new_t[k] = keys_to_numbers(v)
        end
    end
    return new_t
end

return {
    getTasks = function()
        local file = io.open("tasks.json", "r")
        local tasks = json.decode(file:read("a"))
        local num_tasks = keys_to_numbers(tasks)
        return num_tasks
    end,
    getItem = function(v)
        return {size = 10000.0}
    end,
    extractItem = function(v,i)
        print("extracted! "..v..i)
    end,
}
