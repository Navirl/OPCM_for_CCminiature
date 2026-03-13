---@diagnostic disable: undefined-global, undefined-field
local ep = require('structures.ender_pearl')
local mw = require('structures.machine_wall')
local grid = require("component.block_refinedstorage_grid_0")
local make = require("make")
local eg = require("extract_grid")
local extract_chest = require("extract_chest")

--- make.make(e,3)
describe("make", function()
    local tasks = grid.getTasks()
    it("ender_pearl", function()
        local num = eg.getMakingIteminTaskNum("ender_pearl", tasks)
        local toolbar = eg.calcToolbaraboutExtractableTaskItems(tasks[num])
        local s = stub(_G, "print")
        make(ep,toolbar,3)
        local print_all = ""
        for _, call in ipairs(s.calls) do
            print_all = print_all .. tostring(call.vals[1]) .. "\n"
        end
        assert.are.equals(print_all, "forward!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 2\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnRight!\nforward!\nturnLeft!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nforward!\nselect! 1\nplacedown!\nback!\nback!\nturnLeft!\nforward!\nforward!\nturnRight!\nup!\nback!\nback!\ndown!\ndown!\ndown!\nselect! 3\ndrop! 1\n")
        s:clear()
        end)

    it("machine_wall", function()
        local num = eg.getMakingIteminTaskNum("machine_wall", tasks)
        local toolbar = eg.calcToolbaraboutExtractableTaskItems(tasks[num])
        local s = stub(_G, "print")
        make(mw,toolbar,3)
        local print_all = ""
        for _, call in ipairs(s.calls) do
            print_all = print_all .. tostring(call.vals[1]) .. "\n"
        end
        assert.are.equals(print_all, "forward!\nforward!\nselect! 1\nplacedown!\nforward!\nback!\nturnRight!\nforward!\nturnLeft!\nforward!\nback!\nturnLeft!\nforward!\nturnRight!\nup!\nselect! 2\nplacedown!\nforward!\nback!\nturnRight!\nforward!\nturnLeft!\nforward!\nback!\nturnLeft!\nforward!\nturnRight!\nup!\nback!\nback!\ndown!\ndown!\nselect! 2\ndrop! 1\n")
    end)
end)

describe("transposer", function()
    it("extract_chest", function()
        local s = stub(_G, "print")
        extract_chest(0,1)
        local print_all = ""
        for _, call in ipairs(s.calls) do
            local call_printed = tostring(call.vals[1])
            print_all = print_all .. call_printed .. "\n"
        end
        assert.are.equals(print_all, "getAllStacks 0\nfsi 0, tsi 1, size 2.0, fs 1, ts 1\nfsi 0, tsi 1, size 4.0, fs 2, ts 2\n")
    end)
end)
