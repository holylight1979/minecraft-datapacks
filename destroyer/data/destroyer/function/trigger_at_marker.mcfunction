# 移除標記避免重複觸發，並依玩家視角方向與附魔等級執行寬×高×深範圍挖掘
kill @e[type=minecraft:marker,tag=destroyer_target,distance=..0.5]
scoreboard players set @s destroyer.broken 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function destroyer:break_by_direction
execute if score @s destroyer.broken matches 1.. run playsound minecraft:entity.zombie.break_wooden_door player @s ~ ~ ~ 0.2 1.5
