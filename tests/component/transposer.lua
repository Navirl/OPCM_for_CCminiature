local json = require("cjson")
local tkeys_to_numbers = require("tkeys_to_numbers")

local function _numtrans()
    local file = io.open("./tests/debug/exam_trans.json", "r")
    ---@diagnostic disable-next-line: need-check-nil
    local trans = json.decode(file:read("a"))
    local num_trans = tkeys_to_numbers(trans)
    return num_trans
end

return {
    getAllStacks = function(side)
        print("getAllStacks "..side)
        return {
            getAll=function()
                local num_trans = _numtrans()
                return num_trans
            end,
            count=function()
                local num_trans = _numtrans()
                local count = 0
                for _, v in ipairs(num_trans) do
                    count = count + v["size"]
                end
                return count
            end,
        }
    end,
    transferItem = function(fsi,tsi,size,fs,ts)
        print("fsi "..fsi..", tsi "..tsi..", size "..size..", fs "..fs..", ts "..ts)
    end,
    getSlotStackSize = function(side,slot)
        print("side "..side..", slot "..slot)
        local num_trans = _numtrans()
        return num_trans[slot]["size"]
    end,
}
