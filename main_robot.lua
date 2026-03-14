local event = require("event")
local make = require("make")
local json = require("json")
local dl = require("datalist")
local c = require("component")
local tunnel = c.tunnel

while true do
    print("待機中...")
    -- pcから作成依頼を受け取る
    local item_name_e = ""
    local toolbar_item_e = ""
    while true do
        local _, _, _, _, _, recv_data = event.pull("modem_message")
        -- 作成依頼があるなら、どれを作るかが必要
        -- datalistから取り出せば良いんだけど
        -- ツールバー情報も依頼で受け取れ
        local inst, item_name, toolbar_item_raw =
            string.match(recv_data, "([^%^]+)^(.+)^(.+)")
        ---@diagnostic disable-next-line: assign-type-mismatch
        item_name_e = item_name
        toolbar_item_e = json.decode(toolbar_item_raw)
        if inst == "make" then
            print("作成開始")
            break
        end
    end

    make(dl.structure_list[item_name_e], toolbar_item_e, 3)
    print("完了")
    ---@diagnostic disable-next-line: undefined-field
    os.sleep(dl.structure_list[item_name_e].sleep_time)
    tunnel.send("finished")

end
