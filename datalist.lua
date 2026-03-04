local ender_pearl = require("ender_pearl")

local toolbar_list = {}
table.insert(toolbar_list, ender_pearl.toolbar_items)

return {
    toolbar_list = toolbar_list
}
