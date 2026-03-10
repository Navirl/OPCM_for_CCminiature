return {
    getTasks = function()
        return {
            [1] = { ["quantity"] = 2.0,["missingFluids"] = { ["n"] = 0,} ,["missing"] = { ["n"] = 0,} ,["stack"] = { ["item"] = { ["maxDamage"] = 0.0,["size"] = 1.0,["name"] = "minecraft:red_mushroom",["maxSize"] = 64.0,["label"] = "Mushroom",["hasTag"] = false,["damage"] = 0.0,} ,} ,["pattern"] = { ["processing"] = true,["fluidOutputs"] = { ["n"] = 0,} ,["fluidInputs"] = { ["n"] = 0,} ,["oredict"] = false,["inputs"] = { [1] = { [1] = { ["maxDamage"] = 0.0,["size"] = 10.0,["name"] = "minecraft:dye",["maxSize"] = 64.0,["label"] = "Lapis Lazuli",["hasTag"] = false,["damage"] = 4.0,} ,["n"] = 1,} ,[2] = { [1] = { ["maxDamage"] = 0.0,["size"] = 44.0,["name"] = "minecraft:gold_ingot",["maxSize"] = 64.0,["label"] = "Gold Ingot",["hasTag"] = false,["damage"] = 0.0,} ,["n"] = 1,} ,[3] = { [1] = { ["maxDamage"] = 0.0,["size"] = 24.0,["name"] = "immersiveengineering:metal",["maxSize"] = 64.0,["label"] = "Copper Grit",["hasTag"] = false,["damage"] = 9.0,} ,["n"] = 1,} ,[4] = { ["n"] = 0,} ,[5] = { ["n"] = 0,} ,[6] = { ["n"] = 0,} ,[7] = { ["n"] = 0,} ,[8] = { ["n"] = 0,} ,[9] = { ["n"] = 0,} ,["n"] = 9,} ,["outputs"] = { [1] = { ["maxDamage"] = 0.0,["size"] = 1.0,["name"] = "minecraft:red_mushroom",["maxSize"] = 64.0,["label"] = "Mushroom",["hasTag"] = false,["damage"] = 0.0,} ,["n"] = 1,} ,} ,} ,["n"] = 1,
        }
    end,
    getItem = function(v)
        return {size = 10000}
    end,
    extractItem = function(v,i)
        print("extracted! "..v..i)
    end,
}
