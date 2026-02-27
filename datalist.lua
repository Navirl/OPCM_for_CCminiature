local ender_pearl = require("ender_pearl")

local detect_list = {}
table.insert(detect_list, ender_pearl.detect_item)

return {
    detect_list = detect_list
}
