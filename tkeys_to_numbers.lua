-- キーを数値に変換する関数
-- jsonのキーは文字列型しかないので、これで実際のキー型と合わせてテスト可能にする
local function tKeysToNumbers(t)
    if type(t) ~= "table" then return t end

    local new_t = {}
    for k, v in pairs(t) do
        -- キーが文字列で、かつ数値に変換可能な場合
        local num_key = tonumber(k)
        if type(k) == "string" and num_key then
            new_t[num_key] = tKeysToNumbers(v)
        else
            new_t[k] = tKeysToNumbers(v)
        end
    end
    return new_t
end

return tKeysToNumbers
