# 讀取玩家輸入的 op_eq 等級並限制在 1 ~ 255 之間
scoreboard players operation @s op_eq.lvl = @s op_eq
scoreboard players set @s op_eq 0
execute if score @s op_eq.lvl matches ..0 run scoreboard players set @s op_eq.lvl 1
execute if score @s op_eq.lvl matches 256.. run scoreboard players set @s op_eq.lvl 255

# 計算特殊物理上限附魔 (避免原版弩 quick_charge > 4 負數上弦時間無法裝填，以及 multishot 過高卡頓)
scoreboard players operation @s op_eq.qc = @s op_eq.lvl
execute if score @s op_eq.qc matches 5.. run scoreboard players set @s op_eq.qc 4
scoreboard players operation @s op_eq.ms = @s op_eq.lvl
execute if score @s op_eq.ms matches 6.. run scoreboard players set @s op_eq.ms 5

# 將等級寫入 Command Storage 並呼叫 Macro 函數發放全套神裝
execute store result storage destroyer:ctx args.lv int 1 run scoreboard players get @s op_eq.lvl
execute store result storage destroyer:ctx args.qc_lv int 1 run scoreboard players get @s op_eq.qc
execute store result storage destroyer:ctx args.ms_lv int 1 run scoreboard players get @s op_eq.ms
function destroyer:give_op_eq_macro with storage destroyer:ctx args
