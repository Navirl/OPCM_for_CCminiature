local structure = require("structure")

local ender_pearl = {}
setmetatable(ender_pearl, {__index = structure})

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
