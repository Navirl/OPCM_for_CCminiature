local ender_pearl = require('structures.ender_pearl')
local giant_compact_machine = require('structures.giant_compact_machine')
local large_compact_machine = require('structures.large_compact_machine')
local machine_wall = require('structures.machine_wall')
local maximum_compact_machine = require('structures.maximum_compact_machine')
local normal_compact_machine = require('structures.normal_compact_machine')


local structure_list = {}
structure_list[ender_pearl.item_name] = ender_pearl
structure_list[giant_compact_machine.item_name] = giant_compact_machine
structure_list[large_compact_machine.item_name] = large_compact_machine
structure_list[machine_wall.item_name] = machine_wall
structure_list[maximum_compact_machine.item_name] = maximum_compact_machine
structure_list[normal_compact_machine.item_name] = normal_compact_machine


return {
    structure_list = structure_list,
}
