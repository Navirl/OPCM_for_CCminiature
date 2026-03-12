local json = require("cjson")
local tkeys_to_numbers = require("tkeys_to_numbers")

return {
    getTasks = function()
        local file = io.open("./debug/exam_tasks.json", "r")
        ---@diagnostic disable-next-line: need-check-nil
        local tasks = json.decode(file:read("a"))
        local num_tasks = tkeys_to_numbers(tasks)
        return num_tasks
    end,
    getItem = function(v)
        return {size = 10000.0}
    end,
    extractItem = function(v,i)
        print("extracted! "..v..i)
    end,
}
