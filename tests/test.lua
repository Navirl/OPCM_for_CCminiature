---@diagnostic disable: undefined-global, undefined-field



--- make.make(e,3)
describe("make", function()
    local eg = require("extract_grid")
    local c = require("component")
    local grid = c.block_refinedstorage_grid_0
    local tasks = grid.getTasks()
    local make = require("make")
    it("ender_pearl", function()
        local ep = require('structures.ender_pearl')
        local num = eg.getMakingIteminTaskNum("Ender Pearl", tasks)
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
        local mw = require('structures.machine_wall')
        local num = eg.getMakingIteminTaskNum("Compact Machine Wall", tasks)
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

describe("refined", function()
    it("extractItemFromGrid", function()
        local eg = require("extract_grid")
        eg.extractItemFromGrid({name="obsidian",size=1.0},2)
    end)
end)

describe("transposer", function()
    it("extract_chest", function()
        local ec = require("extract_chest")
        local s = stub(_G, "print")
        ec(0,1,1)
        local print_all = ""
        for _, call in ipairs(s.calls) do
            local call_printed = tostring(call.vals[1])
            print_all = print_all .. call_printed .. "\n"
        end
        assert.are.equals(print_all, "side 0, slot 1\nfsi 0, tsi 1, size 2.0, fs 1, ts 1\n")
    end)
end)
