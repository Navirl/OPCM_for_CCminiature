---@diagnostic disable: undefined-global, undefined-field
local e = require("data.ender_pearl")
local make = require("make")

--- make.make(e,3)
describe("Does make work?", function()
    it("ender_pearl", function()
        local s = spy.on(_G, "print")
        make.make(e,3)
        local print_all = ""
        for _, call in ipairs(s.calls) do
            print_all = print_all .. tostring(call.vals[1]) .. "\n"
        end
        -- 最後の改行だけ消す
        assert.are.equals(string.sub(print_all,1,-2), "forward!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 2\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nselect! 3\ndropDown! 1\nback!\nback!\ndown!\ndown!\ndown!")
    end)
end)
