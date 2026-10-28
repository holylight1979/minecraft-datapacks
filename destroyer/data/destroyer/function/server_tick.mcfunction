# 開放所有玩家使用 /trigger 指令
scoreboard players enable @a destroyer_info
scoreboard players enable @a destroyer_kit
execute as @a[scores={destroyer_info=1..}] run function destroyer:show_info
execute as @a[scores={destroyer_kit=1..}] run function destroyer:give_kit

# 清理逾時的目標標記實體
scoreboard players remove @e[type=minecraft:marker,tag=destroyer_target] destroyer.timer 1
kill @e[type=minecraft:marker,tag=destroyer_target,scores={destroyer.timer=..0}]
