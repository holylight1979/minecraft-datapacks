# 若潛行中則不觸發範圍挖掘（保留單格精準挖掘能力）
execute if predicate destroyer:is_sneaking run kill @e[type=minecraft:marker,tag=destroyer_target,distance=..8]
execute if predicate destroyer:is_sneaking run return 0

# 取得主手工具的「破壞者」附魔等級 (1~5)
function destroyer:detect_level
execute if score @s destroyer.lvl matches ..0 run return 0

# 檢查玩家正在挖掘的目標方塊是否剛被挖破（變成空氣）
execute at @e[type=minecraft:marker,tag=destroyer_target,distance=..6,limit=1,sort=nearest] if block ~ ~ ~ #destroyer:air_or_fluid run function destroyer:trigger_at_marker

# 持續刷新玩家準心對準之標記的存活時間（支援挖掘較硬方塊如黑曜石、深板岩）
execute anchored eyes positioned ^ ^ ^1 align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=minecraft:marker,tag=destroyer_target,distance=..0.8] destroyer.timer 20
execute anchored eyes positioned ^ ^ ^2 align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=minecraft:marker,tag=destroyer_target,distance=..0.8] destroyer.timer 20
execute anchored eyes positioned ^ ^ ^3 align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=minecraft:marker,tag=destroyer_target,distance=..0.8] destroyer.timer 20
execute anchored eyes positioned ^ ^ ^4 align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=minecraft:marker,tag=destroyer_target,distance=..0.8] destroyer.timer 20

# 創造模式支援：由於創造模式瞬間破壞不會先觸發 hit_block，用視線追蹤準心方塊
execute if entity @s[gamemode=creative] anchored eyes positioned ^ ^ ^0.25 run function destroyer:raycast_creative_step1
