local event = require("event")
local c = require("component")
local grid = c.block_refinedstorage_grid_0
local eg = require("extract_grid")
local ec = require("extract_chest")
local dl = require("datalist")
local sides = require("sides")
local tunnel = c.tunnel
local json = require("json")


print("信号を待機中...")

-- レッドストーン信号（redstone_changed）が変わるまで一時停止
while true do
  local _, _, _, _, newValue = event.pull("redstone_changed")
  if newValue > 0 then
    print("信号検知！作業を開始します。")
    break
  end
end

local tasks = grid.getTasks()
local task_num = 0
local item_name = ""
-- 作成可能なタスク探し
for i, v in ipairs(dl.item_names) do
    task_num = eg.getMakingIteminTaskNum(v,tasks)
    if task_num ~= "No making that item in tasks." then
        item_name = v
        break
    end
end
if task_num == 0 or task_num == "No making that item in tasks." then
    return print("No making that item in tasks.")
end

-- 作成可能なタスクがアイテムを何個作ろうとしてるか、そこから必要なアイテムのセット数を取る
local set_num = tasks[task_num]["quantity"]
for i=1,set_num do
    -- gridからchestへ
    local toolbar_items = eg.calcToolbaraboutExtractableTaskItems(tasks[task_num])

    for i2,v2 in toolbar_items do
        eg.extractItemsFromGrid(v2,sides.north)
        -- chestからrobotへ
        ec(sides.south,sides.up,i2)
    end

    -- ロボットにやってもらう
    tunnel.send("make^"..item_name.."^"..json.encode(toolbar_items))

    -- ロボットから終了を受け取る
    local _, _, _, _, _, recv_data = event.pull("modem_message")
    -- 終了以外を受け取ったらエラー、終了なら次のextractに進む
    if recv_data ~= "finished" then
        return "error"..recv_data
    end
    print("set " .. i)
end
