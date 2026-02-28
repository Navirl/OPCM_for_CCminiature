local structure = require("data.structure")

local ender_pearl = structure.new()

ender_pearl.proj_struct = {
                    "obsidian","obsidian","obsidian",
                    "obsidian","obsidian","obsidian",
                    "obsidian","obsidian","obsidian",

                    "obsidian","obsidian","obsidian",
                    "obsidian","redblock","obsidian",
                    "obsidian","obsidian","obsidian",

                    "obsidian","obsidian","obsidian",
                    "obsidian","obsidian","obsidian",
                    "obsidian","obsidian","obsidian",
}

ender_pearl.drop_item = "redstone"

ender_pearl.detect_item = "obsidian"

return ender_pearl
